class @Accordion
  constructor: (options = {}) ->
    @container = options.container

  init: ->
    @initPanels()

  initPanels: ->
    @panels = []
    @container.find('.panel').each (i, element) =>
      panel = new Panel
        container: $(element)
        name:      $(element).data('name')
        isOpen:    false
      panel.click @onPanelClick
      panel.init()
      @panels.push panel

  onPanelClick: ->
    console.log 'panel click'
