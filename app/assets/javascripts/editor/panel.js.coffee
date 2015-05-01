class @Panel
  constructor: (options = {}) ->
    @container = options.container
    @name      = options.name

  init: ->
    @header = @container.find('.panel-header')
    @content = @container.find('.panel-content')
    @header.hover @onHeaderHover, @onHeaderHoverOut
    @header.click @onHeaderClick

  click: (handler) ->
    @headerClickHandler = handler

  open: ->
    @content.slideToggle()

  onHeaderHover: (e) =>
    @header.find('.header-icon').css('background', "url(https://s3-eu-west-1.amazonaws.com/events-assets-static/pages/editor/#{@name}_icon_hover.svg)")

  onHeaderHoverOut: (e) =>
    @header.find('.header-icon').css('background', "url(https://s3-eu-west-1.amazonaws.com/events-assets-static/pages/editor/#{@name}_icon.svg)")

  onHeaderClick: (e) =>
    @open()
    @headerClickHandler()




