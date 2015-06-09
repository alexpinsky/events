class @Event
  constructor: (options = {}) ->
    @persistence = options.persistence

  init: ->
    @data = @persistence.getData() || {'text': {}, 'pics': {}}
    @persistence.clean()

  isEmpty: =>
    $.isEmptyObject(@data['text']) && $.isEmptyObject(@data['pics'])

  updateText: (id, val) =>

  updateFont: (id, val) =>

  updateColor: (id, val) =>

  updateSize: (id, val) =>

  updateBackground: (url) =>
