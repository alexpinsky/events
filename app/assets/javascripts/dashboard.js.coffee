class @Dashboard
  @start: ->
    dashboard = new Dashboard
      container: $(".page-wrapper.dashboard")
    dashboard.init()

  constructor: (options = {}) ->
    @container = options.container

  init: ->
    @stateHandler = new StateHandler container: @container

    @container.find('.tile').not('.placeholder').each (i, tileElement) =>
      tileObj = $(tileElement)
      tile = new Tile
        container: tileObj,
        stateHandler: @stateHandler
        event: new Event
          id:   tileObj.data('id')
          name: tileObj.data('name')
          url:  tileObj.data('url')
          persistence: new FakePersistence
      tile.init()
