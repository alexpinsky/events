class @TextElement
  constructor: (options = {}) ->
    @editor = options.editor

  init: ->
    @editor.find('.text-area').each (i, text_element) =>
      text_obj = $(text_element)
      appearance_obj = text_obj.siblings('.appearance-area')
      input_obj = text_obj.find('input')
      @initTextChangeListeners({
        text_obj: text_obj,
        appearance_obj: appearance_obj,
        input_obj: input_obj
      })
      @initFontChangeListeners({
        text_obj: text_obj,
        appearance_obj: appearance_obj
      })
      @initColorListeners({
        text_obj: text_obj,
        appearance_obj: appearance_obj
      })
      @initSizeListeners({
        text_obj: text_obj,
        appearance_obj: appearance_obj
      })

  setText: (targetId, val) =>
    if val
      input = @editor.find('.text-area input#' + targetId)
      input.val(val)
      input.trigger('keyup')

  textChange: (handler) ->
    @textHandler = handler

  fontChange: (handler) ->
    @fontHandler = handler

  sizeChange: (handler) ->
    @sizeHandler = handler

  colorChange: (handler) ->
    @colorHandler = handler

  initTextChangeListeners: (args = {}) =>
    args.input_obj.focus (e) =>
      @onTextFocus(args.text_obj, args.appearance_obj)
      @onAreaFocusout({
        input_obj: args.input_obj,
        appearance_obj: args.appearance_obj,
        text_obj: args.text_obj
      })
    args.input_obj.keyup @onTextKeyup

  onAreaFocusout: (args = {}) =>
    args.input_obj.focusout (e) =>
      @onTextFocusout(args.text_obj, args.appearance_obj, e)
    args.appearance_obj.find('.font-family').focusout (e) =>
      @onTextFocusout(args.text_obj, args.appearance_obj, e)
    args.appearance_obj.find('.font-color').focusout (e) =>
      @onTextFocusout(args.text_obj, args.appearance_obj, e)
    args.appearance_obj.find('.font-size').focusout (e) =>
      @onTextFocusout(args.text_obj, args.appearance_obj, e)

  onTextFocus: (text_obj, appearance_obj) ->
    text_obj.find('span').css({
      'background': 'rgb(13, 86, 163)',
      'color': 'white'
    })
    appearance_obj.slideDown()

  onTextFocusout: (text_obj, appearance_obj, e) ->
    related_obj = $(e.relatedTarget)
    target_obj = $(e.target)
    return if related_obj.data('context') == target_obj.data('context')
    text_obj.find('span').css({
      'background': '',
      'color': ''
    })
    appearance_obj.slideUp()

  onTextKeyup: (e) =>
    target = $(e.target)
    @textHandler(
      targetId: target.data('target') 
      val: target.val()
    ) if @textHandler

  initFontChangeListeners: (args = {}) =>
    args.appearance_obj.find('select.font-family').change (e) =>
      target = $(e.target)
      @fontHandler(
        targetId: target.data('target')
        val: target.val()
      ) if @fontHandler

  initColorListeners: (args = {}) =>
    args.appearance_obj.find('input.minicolors').minicolors 
      defaultValue: '#ffffff'
      change: (hex, opacity) ->
        target_id = $(this).data('target')
        $("#preview").find("p#" + target_id).css("color", hex)

  initSizeListeners: (args = {}) =>
    args.appearance_obj.find('input.font-size').change (e) =>
      target = $(e.target)
      @sizeHandler(
        targetId: target.data('target')
        val: target.val()
      ) if @sizeHandler