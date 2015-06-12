class @TextEdit
  constructor: (options = {}) ->
    @container = options.container
    @lines = {}

  init: ->
    @container.find('.text-line').each (i, element) =>
      obj = $(element)
      target = obj.data('target')
      line = new TextLine container: obj, target: target
      line.textChange @onTextChange
      line.fontChange @onFontChange
      line.colorChange @onColorChange
      line.sizeChange @onSizeChange
      line.init()

      @lines[target] = line

  updateFromEvent: (event) ->
    for id, val of event.texts()
      @updateText id, val

  updateText: (id, val) ->
    @lines[id].updateText(val)

  textChange: (handler) ->
    @textHandler = handler

  fontChange: (handler) ->
    @fontHandler = handler

  colorChange: (handler) ->
    @colorHandler = handler

  sizeChange: (handler) ->
    @sizeHandler = handler


  onTextChange: (id, val) =>
    @textHandler id, val

  onFontChange: (id, val) =>
    @fontHandler id, val

  onColorChange: (id, val) =>
    @colorHandler id, val

  onSizeChange: (id, val) =>
    @sizeHandler id, val
