class @Editor
  constructor: (options={})->
    @editor = options.editor
    @preview = options.preview

  init: ->
    @initTemplates()
    @initText()
    @initBackground()
    @initPics()

  @rebind: ->
    # editor = $('#editor')
    # preview = $('#preview')
    # @rebindText(editor: editor, preview: preview)
    # @rebindBackground(editor: editor, preview: preview)
    # @rebindPics(editor: editor, preview: preview)

  @rebindText: (args) ->
    args.editor.find('.text-area').each (i, text_element) =>
      text_obj = $(text_element)
      text_obj.find('input').keyup()
      appearance_obj = text_obj.siblings('.appearance-area')
      appearance_obj.find('select.font-family').change()
      appearance_obj.find('input.font-size').change()
      color_input = appearance_obj.find('input.minicolors')
      target_id = color_input.data('target')
      args.preview.find("p#" + target_id).css("color", color_input.val())

  @rebindBackground: (args) ->
    backgroundName = args.editor.find("#background_image").val()
    backgroundUrl = null
    args.editor.find('.background-element a.th').each (index, element) =>
      elementObj = $(element)
      if elementObj.data('name') == backgroundName
        backgroundUrl = elementObj.data('url')
        false
    args.preview.find('.event-wrapper').css("background-image", 'url(' + backgroundUrl + ')')

  @rebindPics: (args) ->
    args.editor.find('.pictures-tiles .pic-wrapper img').each (i, element) =>
      console.log element

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

  initImageValidators: (obj) ->
    obj.fileValidator
      maxSize: '1m',
      type: 'image',
      onInvalid: (validationType, file) ->
        file['invalid'] = true

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
    @changePreviewImage(order: args.picOrder, imgUrl: '')

  changePreviewImage: (args = {}) =>
    img = @preview.find('.images #pic-' + args.order)
    img.attr('src', args.imgUrl);

$ ->
  editor = new Editor
    editor: $("#editor"), 
    preview: $("#preview")
  editor.init()