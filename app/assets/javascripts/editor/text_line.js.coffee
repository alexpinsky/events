class @TextLine
  constructor: (options = {}) ->
    @container = options.container
    @id = options.id

  init: ->
    @inputWrapper = @container.find('.input-wrapper')
    @appearanceWrapper = @container.find('.appearance-wrapper')

    input = @inputWrapper.find('input')
    font = @appearanceWrapper.find('.font-family')
    color = @appearanceWrapper.find('.font-color')
    size = @appearanceWrapper.find('.font-size')

    @initFocusinBehavior input
    @initFocusoutBehavior input, font, color, size

    @initChangeListeners input, font, color, size

  textChange: (handler) ->
    @textHandler = handler

  fontChange: (handler) ->
    @fontHandler = handler

  colorChange: (handler) ->
    @colorHandler = handler

  sizeChange: (handler) ->
    @sizeHandler = handler

  initFocusinBehavior: (input) ->
    input.focusin @onFocusin
    input.focusout @focusout

  initFocusoutBehavior: (input, font, color, size) ->
    input.focusout @onFocusout
    font.focusout @onFocusout
    color.focusout @onFocusout
    size.focusout @onFocusout

  onFocusin: =>
    @appearanceWrapper.slideDown()

  onFocusout: (e) =>
    return if $(e.relatedTarget).data('context') == $(e.target).data('context')
    @appearanceWrapper.slideUp()

  initChangeListeners: (input, font, color, size) ->
    input.keyup @onTextKeyup
    font.change @onFontChange
    size.change @onSizeChange
    color.minicolors
      defaultValue: '#ffffff'
      change: @onColorChange

  onTextKeyup: (e) =>
    input = $(e.currentTarget)
    @textHandler input.data('target'), input.val()

  onFontChange: (e) =>

  onSizeChange: (e) =>

  onColorChange: (hex, opacity) =>

