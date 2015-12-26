Function::property = (prop, desc) ->
  Object.defineProperty @prototype, prop, desc

class @Event
  @property 'data',
    get: -> @_data
    set: (newData) -> @_data = newData

  @property 'id',
    get: -> @data.id
    set: (newId) -> @data.id = newId

  @property 'name',
    get: -> @data.name
    set: (newName) -> @data.name = newName

  @property 'url',
    get: -> @data.url
    set: (newUrl) -> @data.url = newUrl

  constructor: (args) ->
    @jsonData = args.data
    @jsonData = JSON.parse @jsonData if typeof @jsonData == 'string'
    @persistence = args.persistence

  init: ->
    @data = @persistence.getData(key: 'event') || @jsonData
    @clear()

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
    @data.pictures[e.order] = { id: e.id, url: e.url, order: e.order }

  removePic: (e) =>
    @data.pictures[e.order] = { id: e.id, url: null, order: e.order }
