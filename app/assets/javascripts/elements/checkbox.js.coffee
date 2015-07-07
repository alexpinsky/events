class @Checkbox
  constructor: (options = {}) ->
    @container = options.container

  init: ->
    @input   = @container.find('input')
    @val     = @input.val()

    @container.append @render()

    @element = @container.find('.checkbox-element')
    @element.click @onClick

  click: (handler) ->
    @handler = handler

  onClick: =>
    if @val == 't'
      @uncheck()
    else
      @check()

  check: ->
    @val = 't'
    @input.val @val
    @element.addClass 'checked'
    @handler 'checked'

  uncheck: ->
    @val = 'f'
    @input.val @val
    @element.removeClass 'checked'
    @handler 'unchecked'

  render: ->
    klass = if @val == 't' || @val == 'true' then 'checked' else ''
    "<div class='checkbox-element #{klass}'></div>"
