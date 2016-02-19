class @Panel
  constructor: (options = {}) ->
    @container = options.container
    @name      = options.name
    @isOpen    = options.isOpen

  init: ->
    @header = @container.find('.panel-header')
    @content = @container.find('.panel-content')
    @header.hover @onHeaderHover, @onHeaderHoverOut
    @header.click @onHeaderClick

    @toggle() if @isOpen

  click: (handler) ->
    @headerClickHandler = handler

  toggle: ->
    @content.slideToggle()

  onHeaderHover: (e) =>
    @header.find('.header-icon').css('background', "url(https://s3-eu-west-1.amazonaws.com/events-assets-static/pages/editor/#{@name}_icon_hover.svg)")

  onHeaderHoverOut: (e) =>
    @header.find('.header-icon').css('background', "url(https://s3-eu-west-1.amazonaws.com/events-assets-static/pages/editor/#{@name}_icon.svg)")

  onHeaderClick: (e) =>
    @toggle()
    @isOpen = !@isOpen
    @headerClickHandler name: @name, isOpen: @isOpen




