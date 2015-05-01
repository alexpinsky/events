class @App
  @start: ->
    app = new App
    app.run()

  run: ->
    @setNameSpaces()

    Dashboard.start()
    Templates.start()
    Editor.start()

  setNameSpaces: ->
    namespace = (target, name, block) ->
      [target, name, block] = [(if typeof exports isnt 'undefined' then exports else window), arguments...] if arguments.length < 3
      top    = target
      target = target[item] or= {} for item in name.split '.'
      block target, top
   
    # namespace "App.Dashboard", (exports) ->
    #   exports.NameEditor = NameEditor
    #   exports.UrlEditor = UrlEditor