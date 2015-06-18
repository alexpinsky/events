class @PicsSelector
  constructor: (options = {}) ->
    @container = options.container

  init: (options = {}) ->
    @container.find('.pic-fields').each (i, element) =>
      obj = $(element)
      pic = new Picture container: obj, order: obj.data('order')
      pic.add @onAdd
      pic.remove @onRemove
      pic.init()

  add: (handler) ->
    @addHandler = handler

  remove: (handler) ->
    @removeHandler = handler

  onAdd: (e) =>
    @addHandler e

  onRemove: (e) =>
    # @removeHandler()