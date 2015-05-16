class @Form
  constructor: (options = {}) ->
    @container = options.container
    @listener = options.listener

  themeClick: (handler) ->
    @handler = handler

  init: ->
    accordion = new Accordion container: @container.find('.accordion')
    accordion.init()

    gallery = new Gallery container: @container.find('.gallery')
    gallery.themeClick @onThemeClick
    gallery.init()

    text = new TextEdit container: @container.find('.text-edit')
    text.textChange @listener.onTextChange
    text.fontChange @listener.onFontChange
    text.colorChange @listener.onColorChange
    text.sizeChange @listener.onSizeChange
    text.init()

  onThemeClick: (e) =>
    @handler e

