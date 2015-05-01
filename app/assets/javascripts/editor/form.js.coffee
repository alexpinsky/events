class @Form
  constructor: (options = {}) ->
    @container = options.container

  init: ->
    accordion = new Accordion
      container: @container.find('.accordion')
    accordion.init()


