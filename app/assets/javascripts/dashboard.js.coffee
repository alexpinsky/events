class @Dashboard
  @start: ->
    dashboard = new Dashboard
      container: $(".page-wrapper.dashboard")
    dashboard.init()  
  
  constructor: (options = {}) ->
    @container = options.container

  init: ->
    @initNameEditors()
    @initUrlEditors()

  initNameEditors: ->
    @container.find(".name-editor").each ->
      nameEditor = new NameEditor
        container: $(this)
        editable: $(this).find(".event-name")
      nameEditor.init()

  initUrlEditors: ->
    @container.find(".url-editor").each ->
      urlEditor = new UrlEditor
        container: $(this)
        editable: $(this).find(".event-url")
      urlEditor.init()