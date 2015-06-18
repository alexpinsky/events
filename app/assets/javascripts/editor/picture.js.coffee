class @Picture
  constructor: (options = {}) ->
    @container = options.container
    @order     = options.order

  init: ->
    @tileWrapper  = @container.find('.tile-wrapper')
    @fileInput    = @container.find('.image-file')
    @destroyInput = @container.find('.destroy')

    @registerToAction()
    @fileInput.change @onInputChange

  add: (handler) ->
    @addHandler = handler

  remove: (handler) ->
    @removeHandler = handler

  registerToAction: ->
    @action = @tileWrapper.find('a')
    @action.click @onActionClick

  onActionClick: (e) =>
    if @action.data('type') == 'add'
      @fileInput.click()
    else
      @doRemove()

  onInputChange: (e) =>
    if @fileInput[0].files && @fileInput[0].files[0]
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
    @addHandler url: url, order: @order

  doRemove: =>
    @drawEmptyTile()
    @fileInput.val ''
    @destroyInput.val true
    @removeHandler order: @order