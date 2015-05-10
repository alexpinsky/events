class @Form
  constructor: (options = {}) ->
    @container = options.container

  init: ->
    accordion = new Accordion
      container: @container.find('.accordion')
    accordion.init()

    gallery = new Gallery
      container: @container.find('.gallery')
    gallery.init()


