class @OldPicture
  constructor: (options = {}) ->
    @container = options.container
    @order     = options.order

  init: ->
    @tileWrapper  = @container.find('.tile-wrapper')
    @fileInput    = @container.find('.image-file')
    @destroyInput = @container.find('.destroy')

    @registerToAction()
    @initSizeValidation()
    @fileInput.change @onInputChange

  initSizeValidation: ->
    @fileInput.fileValidator
      maxSize: '200kb'
      type: 'image'
      onInvalid: (validationType, file) ->
        file.invalid = true

  updatePic: (url, input) ->
    @container.find('.input-wrapper').html input
    @fileInput = @container.find('.image-file')
    @fileInput.change @onInputChange
    @drawImageTile url

  add: (handler) ->
    @addHandler = handler

  remove: (handler) ->
    @removeHandler = handler

  registerToAction: ->
    @action = @tileWrapper.find('a')
    @action.click @onActionClick

  onActionClick: (e) =>
    e.preventDefault()

    if @action.data('type') == 'add'
      @fileInput.click()
    else
      @doRemove()

  onInputChange: (e) =>
    if @fileInput[0].files && @fileInput[0].files[0]
      file = @fileInput[0].files[0]

      if file.invalid
        Notification.display 'Image size should be under 200kb', 'alert'
        return

      reader = new FileReader
      reader.onload = (e) =>
        url = e.target.result
        @doAdd url
      reader.readAsDataURL @fileInput[0].files[0]

  drawImageTile: (url) =>
    @tileWrapper.html "<div class='pic-tile image' style='background-image: url(#{url})'><a href='#'' class='remove' data-type='remove'></a></div>"

    @registerToAction()

  drawEmptyTile: (url) =>
    @tileWrapper.html "<div class='pic-tile empty'><a href='#'' class='add' data-type='add'></a></div>"

    @registerToAction()

  doAdd: (url) =>
    @drawImageTile url
    @destroyInput.val false

    @addHandler url: url, order: @order, input: @fileInput[0]

  doRemove: =>
    @drawEmptyTile()
    @fileInput.val ''
    @destroyInput.val true

    @removeHandler order: @order
