class @Picture
  constructor: (options = {}) ->
    @container = options.container
    @order     = options.order

  init: ->
    @tileWrapper  = @container.find('.tile-wrapper')
    @action       = @tileWrapper.find('a')
    @fileInput    = @container.find('.image-file')
    @destroyInput = @container.find('.destroy')

    @action.click @onActionClick
    @fileInput.change @onInputChange

  add: (handler) ->
    @addHandler = handler

  remove: (handler) ->
    @removeHandler = handler

  onActionClick: (e) =>
    if @action.data('type') == 'add'
      @doAdd()
    else
      @doRemove()

  onInputChange: (e) =>
    if @fileInput[0].files && @fileInput[0].files[0]
      reader = new FileReader
      reader.onload = (e) =>
        url = e.target.result
        @drawImageTile url
        @addHandler url: url, order: @order
      reader.readAsDataURL @fileInput[0].files[0]

  drawImageTile: (url) =>
    @tileWrapper.html "<div class='pic-tile image' style='background-image: url(#{url})'><a href='#'' class='remove' data-type='remove'></a></div>"

    @action = @tileWrapper.find('a')
    @action.click @onActionClick

  doAdd: =>
    @fileInput.click()

  doRemove: =>
    console.log 'remove'