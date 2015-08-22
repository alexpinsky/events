class @Tile
  constructor: (args) ->
    @container    = args.container
    @event        = args.event
    @stateHandler = args.stateHandler
    @editable     = new Editable target: @container.find('.event-name')

  updateIcon: (icon) =>

  onNameSave: (data) =>
    @event.name = data.newName

  onPublishClick: (e) =>
    @stateHandler.publish
      event:      @event
      submitable: @editable
      saved:      @onSaved
      published:  @onPublished
      error:      @onPublishError

  onUpublishClick: (e) =>
    @stateHandler.unpublish
      event:       @event
      unpublished: @onUnpublished
      error:       @onUnpublishError

  onPublished: (data) =>
    @updateIcon 'unpublish'

  onUnpublished: (data) =>
    @updateIcon 'publish'

  onPublishError: (data) =>
  onUnpublishError: (data) =>
  onSaved: (data) =>

  init: ->
    @editable.save @onNameSave
    @editable.init()

    @container.find('.actions .publish').click   @onPublishClick
    @container.find('.actions .unpublish').click @onUnpublishClick