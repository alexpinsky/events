class @Event
  constructor: (options = {}) ->
    @persistence = options.persistence

  init: ->
    @data = @persistence.getData() || {'texts': {}, 'pics': {}}
    @persistence.clear()

  save: ->
    @persistence.saveData @data

  isEmpty: =>
    $.isEmptyObject(@data.texts) && $.isEmptyObject(@data.pics)

  texts: ->
    @data.texts

  updateText: (id, val) =>
    @data.texts[id] = val

  updateFont: (id, val) =>

  updateColor: (id, val) =>

  updateSize: (id, val) =>

  updateBackground: (url) =>

  addPic: (e) =>

  removePic: (e) =>
