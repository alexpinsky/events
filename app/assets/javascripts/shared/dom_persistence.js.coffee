class @DOMPersistence
  getData: (args) ->
    $('body').data(args.key)

  saveData: (args) ->
    $('body').data args.key, args.data

  clear: (args) ->
    $('body').data args.key, null