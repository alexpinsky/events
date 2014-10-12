class Categories
  constructor: (options = {}) ->
    @container = options.container

  init: ->
    @initTileListeners()

  initTileListeners: ->
    @container.find('.event-tile').each (i, obj) ->
      $(obj).hover ((e) =>
        tile_obj = $(e.currentTarget)
        tile_obj.find('.menu-container').css("visibility", "visible")
      ), (e) =>
        tile_obj = $(e.currentTarget)
        tile_obj.find('.menu-container').css("visibility", "hidden")
        

$ ->
  categories = new Categories({container: $('.categories-index')})
  categories.init()