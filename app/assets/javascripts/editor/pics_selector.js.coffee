class @PicsSelector
  constructor: (options = {}) ->
    @container = options.container
    @pics = {}

  init: (options = {}) ->
    @container.find('.pic-fields').each (i, element) =>
      obj = $(element)
      order = obj.data('order')
      pic = new OldPicture container: obj, order: order
      pic.add @onAdd
      pic.remove @onRemove
      pic.init()

      @pics[order] = pic

  add: (handler) ->
    @addHandler = handler

  remove: (handler) ->
    @removeHandler = handler

  updateFromEvent: (event) ->
    for order, valObj of event.pics()
      @pics[order].updatePic valObj.url, valObj.input

  onAdd: (e) =>
    @addHandler e

  onRemove: (e) =>
    @removeHandler e