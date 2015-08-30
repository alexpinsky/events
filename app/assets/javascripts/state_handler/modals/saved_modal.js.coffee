class @SavedModal
  constructor: (args) ->
    @modal = args.modal

  init: ->
    @modal.find('a.done').click    @onDone
    @modal.find('a.publish').click @onPublish

  show: (args) ->
    @event          = args.event
    @doneHandler    = args.done
    @publishHandler = args.publish

    @modal.modal clickClose: false

  hide: ->
    $.modal.close()

  onDone: =>
    @doneHandler event: @event

  onPublish: =>
    @publishHandler()
