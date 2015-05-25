class @BackgroundGallery
  constructor: (options = {}) ->
    @container = options.container

  click: (handler) ->
    @handler = handler

  init: ->
    @container.find('.background-tiles .background-tile').each (i, element) =>
      tile = new BackgroundTile container: $(element)
      tile.click @onTileClick
      tile.init()

  onTileClick: (url) =>
    @handler url
