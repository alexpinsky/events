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
      line = new TextLine container: $(element)
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

  onsSizeChange: (id, val) =>
    @sizeHandler id, val
