class @Accordion
  constructor: (options = {}) ->
    @container   = options.container
    @persistence = options.persistence

  init: ->
    @initPanels()

  initPanels: ->
    @container.find('.panel').each (i, element) =>
      obj       = $(element)
      name      = obj.data('name')
      saveData  = @persistence.getData(key: 'accordion') || {}
      panelData = saveData["#{name}Panel"] || {}

      panel = new Panel
        container: obj
        name:      name
        isOpen:    panelData.isOpen
      panel.click @onPanelClick
      panel.init()

  onPanelClick: (data) =>
    panelKey    = "#{data.name}Panel"
    savedData = @persistence.getData(key: 'accordion') || {}
    savedData[panelKey] = { isOpen: data.isOpen }
    @persistence.saveData key: 'accordion', data: savedData