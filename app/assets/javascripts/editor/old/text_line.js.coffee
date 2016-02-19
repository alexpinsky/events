class @TextLine
  constructor: (options = {}) ->
    @container = options.container
    @target = options.target

  init: ->
    @inputWrapper = @container.find('.input-wrapper')
    @appearanceWrapper = @container.find('.appearance-wrapper')

    input = @inputWrapper.find('input')
    color = @appearanceWrapper.find('.font-color')
    size = @appearanceWrapper.find('.font-size')

    @fontComponentWrapper = @appearanceWrapper.find('.text-font')
    ReactDOM.render(
      React.createElement(FontPicker, {
        count: @fontComponentWrapper.data('count'),
        initialFontVal: @fontComponentWrapper.data('font'),
        handleChange: @onFontChange
      }),
      @fontComponentWrapper[0]
    );

    @initFocusinBehavior input
    @initFocusoutBehavior [input, color, size]

    @initChangeListeners input, color, size

  destroy: ->
    ReactDOM.unmountComponentAtNode @fontComponentWrapper[0]

  updateText: (val) ->
    @inputWrapper.find('input').val val

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

  initFocusoutBehavior: (objects) ->
    for obj in objects
      obj.focusout @onFocusout

  onFocusin: (e) =>
    pressed = $(e.currentTarget)

    icon = pressed.siblings('.input-icon')
    iconCount = pressed.data('context')

    pressed.css('border', '1px solid rgb(255, 141, 9)')
    icon.css("background", "url(https://s3-eu-west-1.amazonaws.com/events-assets-static/pages/editor/#{iconCount}_icon_hover.svg)")

    # @appearanceWrapper.slideDown()

  onFocusout: (e) =>
    pressed = $(e.relatedTarget)
    unpressed = $(e.currentTarget)
    return if pressed.data('context') == unpressed.data('context')

    unpressed = @container.find('.input-wrapper :input') # change to the input

    iconCount = unpressed.data('context')
    icon = unpressed.siblings('.input-icon')
    icon.css("background", "url(https://s3-eu-west-1.amazonaws.com/events-assets-static/pages/editor/#{iconCount}_icon.svg)")

    unpressed.css('border', '1px solid rgb(127, 159, 255)')

    # @appearanceWrapper.slideUp()

  initChangeListeners: (input, color, size) ->
    input.keyup @onTextKeyup
    size.change @onSizeChange
    color.minicolors
      defaultValue: '#ffffff'
      change: @onColorChange

  onTextKeyup: (e) =>
    input = $(e.currentTarget)
    @textHandler @target, input.val()

  onFontChange: (newFont) =>
    @fontHandler @target, newFont.value

  onSizeChange: (e) =>
    input = $(e.currentTarget)
    @sizeHandler @target, input.val()

  onColorChange: (hex, opacity) =>
    @colorHandler @target, hex

