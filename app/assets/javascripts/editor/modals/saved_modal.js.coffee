class @SavedModal
  constructor: (args) ->
    @modal = args.modal

  init: ->
    @modal.find('a.done').click    @onDone
    @modal.find('a.publish').click @onPublish

  show: ->
    @modal.modal clickClose: false

  hide: ->
    $.modal.close()

  publish: (handler) ->
    @publishHandler = handler

  close: (handler) ->
    @closeHandler = handler

  onDone: =>
    @closeHandler()

  onPublish: =>
    @publishHandler()
