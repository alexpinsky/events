class @Information
  constructor: (options = {}) ->
    @container = options.container

  init: ->
    checkbox = new Checkbox container: @container.find('.checkbox')
    checkbox.init()
