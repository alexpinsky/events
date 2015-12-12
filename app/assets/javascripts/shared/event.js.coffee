class @Event
  constructor: (args) ->
    @jsonData = args.data
    @persistence = args.persistence

  init: ->
    @data = @persistence.getData(key: 'event') || @jsonData
    @clear()

  getData: -> @data

  id: -> @data.id
  id: (id) -> @data.id = id

  name: -> @data.name
  name: (name) -> @data.name = name

  url: -> @data.url
  url: (url) -> @data.url = url

  save: ->
    @persistence.saveData key: 'event', data: @data

  clear: ->
    @persistence.clear key: 'event'

  texts: ->
    @data.texts

  pics: ->
    @data.pictures

  updateText: (id, val) =>
    @data.texts[id] = val

  updateFont: (id, val) =>

  updateColor: (id, val) =>

  updateSize: (id, val) =>

  updateBackground: (url) =>

  addPic: (e) =>
    @data.pictures[e.order] = { url: e.url, order: e.order }

  removePic: (e) =>
    @data.pictures[e.order] = null
