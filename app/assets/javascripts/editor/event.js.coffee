class @Event
  constructor: (options = {}) ->
    @persistence = options.persistence

  init: ->
    @data = @persistence.getData() || { texts: {}, pics: {}, name: '' }
    @clear()

  save: ->
    @persistence.saveData @data

  clear: ->
    @persistence.clear()

  isEmpty: =>
    $.isEmptyObject(@data.texts) && $.isEmptyObject(@data.pics)

  isNameless: ->
    @name == ''

  texts: ->
    @data.texts

  pics: ->
    @data.pics

  name: ->
    @data.name

  updateText: (id, val) =>
    @data.texts[id] = val

  updateFont: (id, val) =>

  updateColor: (id, val) =>

  updateSize: (id, val) =>

  updateBackground: (url) =>

  updateName: (name) =>
    @data.name = name

  addPic: (e) =>
    @data.pics[e.order] = { url: e.url, input: e.input }

  removePic: (e) =>
    @data.pics[e.order] = null
