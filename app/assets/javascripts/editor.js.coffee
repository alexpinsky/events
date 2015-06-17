class @Editor
  @start: ->
    if window.currentEditor
      prevEditor = window.currentEditor
      prevEditor.destroy()
      prevEditor = null

    event = new Event persistence: new LocalPersistence
    event.init()

    editor = new Editor container: $('.page-wrapper.editor'), event: event
    editor.init()

    window.currentEditor = editor

  constructor: (options = {}) ->
    @container = options.container
    @event = options.event

  init: ->
    @initVendors()

    @preview = new Preview container: @container.find('.preview-wrapper')
    @preview.init event: @event

    @delegator  = new ChangesDelegator
      event: @event
      view: @preview

    @form = new Form
      container: @container.find('.form-wrapper')
      listener: @delegator
    @form.themeClick @onThemeClick
    @form.submitSuccess @onSubmitSuccess
    @form.submitError @onSubmitError
    @form.init event: @event

    @container.find('.save-wrapper .save').click @onSaveClick

  initVendors: ->
    addthisevent.refresh()
    imagesObj = $('.images')
    if imagesObj.data('slideshow')
      imagesObj.slick
        autoplay: true,
        arrows: false,
        mobileFirst: true

  destroy: ->
    @preview.destroy()
    @preview = null
    @delegator.destroy()
    @delegator = null
    @form.destroy()
    @form = null

  loadTheme: (category, theme) ->
    @event.save()

    eventId = $('.event').data('event')

    if eventId
      url = "/events/#{eventId}/edit"
    else
      url = '/events/new'

    $.ajax
      url: url
      data: { category_id: category, theme_id: theme }
      dataType: "script"

  onThemeClick: (e) =>
    @loadTheme e.category, e.theme

  onSaveClick: =>
    @form.submit()

  onSubmitSuccess: (data) =>
    alert('success')
    # reload the page in edit mode (need to update all fields)
    $.ajax
      url: "/events/#{data.event_id}/edit"
      dataType: "script"

  onSubmitError: =>
    alert('error')

  ###################################################################

  initBackground: ->
    element = new BackgroundElement
      backgroundObj: @editor.find('.background-element')
    element.backgroundClick @onBackgroundClick
    element.init()

  initPics: ->
    formObj = @editor.find('#event_form')
    @picsElement = new PicsElement
      picsObj: formObj.find('.pics-element')
    @picsElement.addImage @onAddImage
    @picsElement.removeImage @onRemoveImage
    @picsElement.init()
    formObj.find('input.image-file').change (e) =>
      input = e.currentTarget
      order = $(input).data('order')
      @editor.find('#pic-destroy-' + order).val(false)
      if input.files && input.files[0]
        reader = new FileReader
        reader.onload = (e) =>
          imgUrl = e.target.result
          @picsElement.changePreview(order: order, imgUrl: imgUrl)
          @changePreviewImage(order: order, imgUrl: imgUrl)
          @storePic(order: order, url: imgUrl, input: input)
        reader.readAsDataURL(input.files[0])

  initText: ->
    @textElement = new TextElement
      editor: @editor
    @textElement.textChange @onTextChange
    @textElement.fontChange @onFontChange
    @textElement.sizeChange @onSizeChange
    @textElement.init()

  initCalendar: ->
    element = new CalendarElement
      calendarObj: @editor.find('.calendar-element')
    element.check @onCheckCalendar
    element.uncheck @onUncheckCalendar
    element.init()

  # initImageValidators: (obj) ->
  #   obj.fileValidator
  #     maxSize: '1m',
  #     type: 'image',
  #     onInvalid: (validationType, file) ->
  #       file['invalid'] = true

  onTextChange: (args = {}) =>
    @preview.find("#" + args.targetId).text(args.val)
    @storeText(args)

  getEvent: =>
    body = $('body')
    event = body.data('event')
    event = {'text': {}, 'pic': {}} unless event
    event

  storeEvent: (event) =>
    $('body').data('event', event)

  _loadEvent: =>
    event = @getEvent()
    $.each event.text, (key, val) =>
      @textElement.setText(key, val)
    $.each event.pic, (key, val) =>
      @picsElement.setPic(key, val.url)
      @changePreviewImage(order: key, imgUrl: val.url)
      @replaceInput(input: val.input)

  storeText: (args = {}) =>
    event = @getEvent()
    event['text'][args.targetId] = args.val
    @storeEvent(event)

  replaceInput: (args = {}) =>
    input = args.input
    inputWrapper = @editor.find('#pic-input-' + $(input).data('order'))
    inputWrapper.html(input)

  storePic: (args = {}) =>
    event = @getEvent()
    event['pic'][args.order] = {url: args.url, input: args.input}
    @storeEvent(event)

  onFontChange: (args = {}) =>
    @preview.find('#' + args.targetId).css("font-family", args.val)

  onSizeChange: (args = {}) =>
    @preview.find('#' + args.targetId).css("font-size", (args.val / 16) + 'em')

  onBackgroundClick: (args = {}) =>
    @preview.find('.event-wrapper').css("background-image", 'url(' + args.backgroundUrl + ')')
    @editor.find("#background_image").val(args.backgroundName)

  onAddImage: (args = {}) =>
    fileInput = @editor.find('#image-file-' + args.picOrder)
    fileInput.click()

  onRemoveImage: (args = {}) =>
    fileInput = @editor.find('#image-file-' + args.picOrder)
    fileInput.val('')
    @editor.find('#pic-destroy-' + args.picOrder).val(true)
    defaultUrl = @editor.find('.pic-wrapper #tile-' + args.picOrder).data('default')
    @changePreviewImage(order: args.picOrder, imgUrl: defaultUrl)
    @storePic(order: args.picOrder, url: undefined, input: undefined)

  changePreviewImage: (args = {}) =>
    img = @preview.find('#pic-' + args.order)
    img.attr('src', args.imgUrl);

  onCheckCalendar: =>
    @preview.find('.calendar-wrapper').css('visibility', 'visible')

  onUncheckCalendar: =>
    @preview.find('.calendar-wrapper').css('visibility', 'hidden')
