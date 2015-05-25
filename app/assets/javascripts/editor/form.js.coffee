class @Form
  constructor: (options = {}) ->
    @container = options.container
    @listener = options.listener

  themeClick: (handler) ->
    @handler = handler

  init: ->
    accordion = new Accordion container: @container.find('.accordion')
    accordion.init()

    theme = new ThemeGallery container: @container.find('.gallery')
    theme.click @onThemeClick
    theme.init()

    text = new TextEdit container: @container.find('.text-edit')
    text.textChange @onTextChange
    text.fontChange @onFontChange
    text.colorChange @onColorChange
    text.sizeChange @onSizeChange
    text.init()

    background = new BackgroundGallery container: @container.find('.background-section')
    background.click @onBackgroundChange
    background.init()

  onThemeClick: (e) =>
    @handler e

  onTextChange: (id, val) =>
    @listener.onTextChange id, val

  onFontChange: (id, val) =>
    @listener.onFontChange id, val

  onColorChange: (id, val) =>
    @listener.onColorChange id, val

  onSizeChange: (id, val) =>
    @listener.onSizeChange id, val

  onBackgroundChange: (url) =>
    @container.find('#background-image').val url
    @listener.onBackgroundChange url

