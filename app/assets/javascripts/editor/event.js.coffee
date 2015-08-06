class @Event
  constructor: (options = {}) ->
    @id          = options.id
    @persistence = options.persistence

  init: ->
    console.log "eventId: #{@id}"
    @data = @persistence.getData() || { texts: {}, pics: {} }
    @clear()

  save: ->
    @persistence.saveData @data

  clear: ->
    @persistence.clear()

  isEmpty: =>
    $.isEmptyObject(@data.texts) && $.isEmptyObject(@data.pics)

  id: ->
    @id

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
