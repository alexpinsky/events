class @Event
  constructor: (options = {}) ->
    @persistence = options.persistence
    @id          = options.id

  init: ->
    @data = @persistence.getData() || { texts: {}, pics: {} }
    @clear()

  id: ->
    @id

  id: (id) ->
    @id = id

  save: ->
    @persistence.saveData @data

  clear: ->
    @persistence.clear()

  isEmpty: =>
    $.isEmptyObject(@data.texts) && $.isEmptyObject(@data.pics)

  texts: ->
    @data.texts

  pics: ->
    @data.pics

  updateText: (id, val) =>
    @data.texts[id] = val

  updateFont: (id, val) =>

  updateColor: (id, val) =>

  updateSize: (id, val) =>

  updateBackground: (url) =>

  addPic: (e) =>
    @data.pics[e.order] = { url: e.url, input: e.input }

  removePic: (e) =>
    @data.pics[e.order] = null
