class @Event
  constructor: (args) ->
    @persistence = args.persistence
    @id          = args.id
    @name        = args.name
    @url         = args.url

  init: ->
    @data = @persistence.getData() || { texts: {}, pics: {} }
    @clear()

  id: -> @id
  id: (id) -> @id = id

  name: -> @name
  name: (name) -> @name = name

  url: -> @url
  url: (url) -> @url = url

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
