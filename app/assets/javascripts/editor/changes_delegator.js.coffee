class @ChangesDelegator
  constructor: (options = {}) ->
    @view = options.view

  onTextChange: (id, val) =>
    @view.updateText id, val

  onFontChange: (id, val) =>
    @view.updateFont id, val

  onColorChange: (id, val) =>
    @view.updateColor id, val

  onSizeChange: (id, val) =>
    @view.updateSize id, val

