class @PublishModal
  constructor: (args) ->
    @modal = args.modal

  init: ->
    @modal.find('.modal-actions .publish').click @onPublishClick
    @modal.find('.modal-actions .cancel').click  @onCancelClick
    @input = @modal.find('.url-wrapper input')

  show: (args) ->
    @cancelHandler  = args.cancel
    @publishHandler = args.publish
    @input.val args.url

    @modal.modal clickClose: false

  hide: ->
    $.modal.close()

  onCancelClick: =>
    @cancelHandler()

  onPublishClick: =>
    @publishHandler url: @input.val()

