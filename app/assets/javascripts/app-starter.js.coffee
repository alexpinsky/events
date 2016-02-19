class @AppStarter
  @start: ->
    app = new AppStarter
    app.run()

  run: ->
    path = window.location.pathname
    if @dashboardRegexp().test(path)
      Dashboard.start()
    else if @templatesRegexp().test(path)
      Templates.start()

  dashboardRegexp: -> new RegExp /^\/events$/
  templatesRegexp: -> new RegExp /^\/templates$/