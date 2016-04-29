class @AppStarter
  @start: ->
    app = new AppStarter
    app.run()

  run: ->
    path = window.location.pathname
    if @templatesRegexp().test(path)
      Templates.start()

  templatesRegexp: -> new RegExp /^\/templates$/