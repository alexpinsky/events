class Dashboard
  
  constructor: (options = {}) ->
    @container = options.container

  init: ->
    @initNameEditors()
    @initUrlEditors()

  initNameEditors: ->
    @container.find(".name-editor").each ->
      nameEditor = new NameEditor
        container: $(this)
      nameEditor.init()


  initUrlEditors: ->


$ ->
  dashboard = new Dashboard
    container: $(".page-wrapper.dashboard")
  dashboard.init()