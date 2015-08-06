class @PublishModal
  constructor: (args) ->
    @modal   = args.modal

  init: ->
    @modal.find('.modal-actions .publish').click @onPublishClick
    @modal.find('.modal-actions .cancel').click  @onCancelClick
    @input = @modal.find('.url-wrapper input')

  close: (handler) ->
    @closeHandler = handler

  publish: (handler) ->
    @publishHandler = handler

  show: ->
    @modal.modal clickClose: false

  hide: ->
    $.modal.close()

  onCancelClick: =>
    @closeHandler()

  onPublishClick: =>
    @publishHandler url: @input.val()

