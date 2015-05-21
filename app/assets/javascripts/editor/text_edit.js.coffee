class @TextEdit
  constructor: (options = {}) ->
    @container = options.container

  textChange: (handler) ->
    @textHandler = handler

  fontChange: (handler) ->
    @fontHandler = handler

  colorChange: (handler) ->
    @colorHandler = handler

  sizeChange: (handler) ->
    @sizeHandler = handler

  init: ->
    lines = []
    @container.find('.text-line').each (i, element) =>
      obj = $(element)
      line = new TextLine container: obj, target: obj.data('target')
      line.textChange @onTextChange
      line.fontChange @onFontChange
      line.colorChange @onColorChange
      line.sizeChange @onSizeChange
      line.init()

      lines.push line

  onTextChange: (id, val) =>
    @textHandler id, val

  onFontChange: (id, val) =>
    @fontHandler id, val

  onColorChange: (id, val) =>
    @colorHandler id, val

  onSizeChange: (id, val) =>
    @sizeHandler id, val
