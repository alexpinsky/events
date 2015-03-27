class Categories
  constructor: (options = {}) ->
    @container = options.container

  init: ->
    @initTileListeners()

  initTileListeners: ->
    @container.find('.tile.exist').each (i, obj) ->
      $(obj).hover ((e) =>
        tile_obj = $(e.currentTarget)
        tile_obj.find('.menu-wrapper').css("visibility", "visible")
      ), (e) =>
        tile_obj = $(e.currentTarget)
        tile_obj.find('.menu-wrapper').css("visibility", "hidden")
        

$ ->
  categories = new Categories container: $('.page-wrapper.categories')
  categories.init()