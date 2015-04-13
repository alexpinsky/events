class Dashboard
  
  constructor: (options = {}) ->
    @container = options.container

  init: ->
    @container.find(".event-name").editable
      mode: 'inline'
      clear: false
      ajaxOptions:
        type: 'put'
        dataType: 'json'


$ ->
  dashboard = new Dashboard
    container: $(".page-wrapper.dashboard")
  dashboard.init()