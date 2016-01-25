class @App
  @start: ->
    app = new App
    app.run()

  run: ->
    path = window.location.pathname
    if @dashboardRegexp().test(path)
      Dashboard.start()
    else if @templatesRegexp().test(path)
      Templates.start()
    else if @editorRegexp().test(path)
      Editor.start()

  editorRegexp:    -> new RegExp /^\/events\/?[0-9]*\/(new|edit)/
  dashboardRegexp: -> new RegExp /^\/events$/
  templatesRegexp: -> new RegExp /^\/templates$/