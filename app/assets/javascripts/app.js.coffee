class @App
  @start: ->
    app = new App
    app.run()

  run: ->
    Dashboard.start()
    Templates.start()
    Editor.start()
