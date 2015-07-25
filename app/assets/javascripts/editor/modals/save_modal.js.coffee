class @SaveModal
  constructor: (args) ->
    @modal = args.modal

  init: ->
    @input = @modal.find 'input'
    @modal.find('a.save').click @onSave
    @modal.find('a.cancel').click @onCancel

  save: (handler) ->
    @saveHandler = handler

  close: (handler) ->
    @closeHandler = handler

  show: ->
    @modal.modal clickClose: false

  hide: ->
    $.modal.close()

  onSave: =>
    val = @input.val()
    if val
      @saveHandler name: val
    else
      Notification.display 'You must enter a name', 'alert'

  onCancel: =>
    @closeHandler()