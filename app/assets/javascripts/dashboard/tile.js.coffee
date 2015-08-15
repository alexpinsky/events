class @Tile
  constructor: (args) ->
    @container    = args.container
    @eventId      = args.eventId
    @stateHandler = args.stateHandler

  updateIcon: (icon) =>

  updateName: (name) =>

  onPublishClick: (e) =>
    @stateHandler.publish
      eventId: @eventId
      success: @onPublishSuccess
      error:   @onPublishError

  onUpublishClick: (e) =>
    @stateHandler.unpublish
      eventId: @eventId
      success: @onUnpublishSuccess
      error:   @onUnpublishError

  onPublishSuccess: (data) =>
    @updateName data.eventName
    @updateIcon 'unpublish'

  onUnpublishSuccess: (data) =>
    @updateIcon 'publish'

  onPublishError: (data) =>
  onUnpublishError: (data) =>

  init: ->
    @initInlineUpdate()
    @container.find('.actions .publish').click   @onPublishClick
    @container.find('.actions .unpublish').click @onUnpublishClick

  initInlineUpdate: ->
    @container.find('.name-editor').editable
      mode: 'inline'
      clear: false
      ajaxOptions:
        type: 'put'
        dataType: 'json'
      params: (params) ->
        event: {
          name: params.value
        }