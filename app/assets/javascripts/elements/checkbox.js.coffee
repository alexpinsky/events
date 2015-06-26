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
    if @val
      @uncheck()
    else
      @check()

  check: ->
    @val = true
    @input.val @val
    @element.addClass 'checked'

  uncheck: ->
    @val = false
    @input.val @val
    @element.removeClass 'checked'

  render: ->
    klass = if @val then 'checked' else ''
    "<div class='checkbox-element #{klass}'></div>"
