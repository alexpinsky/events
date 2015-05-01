class @Editor
  @start: ->
    editor = new Editor
      container: $('.page-wrapper.editor')
    editor.init()

  constructor: (options = {})->
    @container = options.container

  init: ->
    form = new Form
      container: @container.find('.form-wrapper')
    form.init()

    preview = new Preview
      container: @container.find('.preview-wrapper')
    preview.init()
    # @initTemplates()
    # @initText()
    # @initBackground()
    # @initPics()
    # @initCalendar()
    # @loadEvent()

  initTemplates: ->
    element = new SliderElement
      slider_obj: @editor.find('.slider-element')
    element.themeClick @onThemeClick
    element.init()

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

  onThemeClick: (args = {}) =>
    eventId = $('.edit-event').data('event')
    if eventId
      url = '/events/' + eventId + '/edit'
    else
      url = '/events/new'
    $.ajax
      url: url
      data: { category_id: args.category, theme_id: args.theme }
      dataType: "script"

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

  loadEvent: =>
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
