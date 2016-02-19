class @BackgroundTile
  constructor: (options = {}) ->
    @container = options.container

  click: (handler) ->
    @handler = handler

  init: ->
    @container.click @onTileClick

  onTileClick: (e) =>
    url = $(e.currentTarget).data('url')
    @handler url