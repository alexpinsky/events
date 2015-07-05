class @Checkbox
  constructor: (options = {}) ->
    @container = options.container

  init: ->
    @input   = @container.find('input')
    @val     = @input.val()

    @container.append @render()

    @element = @container.find('.checkbox-element')
    @element.click @onClick

  onClick: =>
    if @val == 't'
      @uncheck()
    else
      @check()

  check: ->
    @val = 't'
    @input.val @val
    @element.addClass 'checked'

  uncheck: ->
    @val = 'f'
    @input.val @val
    @element.removeClass 'checked'

  render: ->
    klass = if @val == 't' then 'checked' else ''
    "<div class='checkbox-element #{klass}'></div>"
