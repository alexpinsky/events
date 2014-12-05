class @Editor
  constructor: (options={})->
    @editor = options.editor
    @preview = options.preview

  init: ->
    @initTemplates()
    @initText()
    @initBackground()
    @initPics()
    @initCalendar()

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
    element = new PicsElement
      picsObj: formObj.find('.pics-element')
    element.addImage @onAddImage
    element.removeImage @onRemoveImage
    element.init()
    
    formObj.find('input.image-file').change (e) =>
      input = e.currentTarget
      if input.files && input.files[0]
        reader = new FileReader
        reader.onload = (e) =>
          order = $(input).data('order')
          imgUrl = e.target.result
          element.changePreview(order: order, imgUrl: imgUrl)
          @changePreviewImage(order: order, imgUrl: imgUrl)
        reader.readAsDataURL(input.files[0])
    
  initText: ->
    element = new TextElement
      editor: @editor,
      preview: @preview
    element.init()

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

  onBackgroundClick: (args = {}) =>
    @preview.find('.event-wrapper').css("background-image", 'url(' + args.backgroundUrl + ')')
    @editor.find("#background_image").val(args.backgroundName)

  onAddImage: (args = {}) =>
    fileInput = @editor.find('#image-file-' + args.picOrder)
    fileInput.click()

  onRemoveImage: (args = {}) =>
    fileInput = @editor.find('#image-file-' + args.picOrder)
    fileInput.val('')
    defaultUrl = @editor.find('.pic-wrapper #tile-' + args.picOrder).data('default')
    console.log defaultUrl
    @changePreviewImage(order: args.picOrder, imgUrl: defaultUrl)

  changePreviewImage: (args = {}) =>
    img = @preview.find('.images #pic-' + args.order)
    img.attr('src', args.imgUrl);

  onCheckCalendar: =>
    @preview.find('.calendar').css('visibility', 'visible')

  onUncheckCalendar: =>
    @preview.find('.calendar').css('visibility', 'hidden')

$ ->
  editor = new Editor
    editor: $("#editor"), 
    preview: $("#preview")
  editor.init()