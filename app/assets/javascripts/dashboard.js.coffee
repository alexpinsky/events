class @Dashboard
  @start: ->
    dashboard = new Dashboard
      container: $(".page-wrapper.dashboard")
    dashboard.init()

  constructor: (options = {}) ->
    @container = options.container

  init: ->
    @stateHandler = new StateHandler
    @stateHandler.init()

    @container.find('.tile').not('.placeholder').each (tile) =>
      tileObj = $(tile)
      tile = new Tile
        container: tileObj,
        stateHandler: @stateHandler
        eventId: tileObj.data('event-id')
      tile.publish   @onPublish
      tile.unpublish @onUnpublish
      tile.init()
