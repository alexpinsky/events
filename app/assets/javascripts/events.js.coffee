class Events
  constructor: (options={})->
    @container = options.container

  init: ->

$ ->
  events = new Events({container: $(".event-wrapper")})
  events.init()