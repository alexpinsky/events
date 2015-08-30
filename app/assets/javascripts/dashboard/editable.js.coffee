class @Editable
  constructor: (args) ->
    @target = args.target

  submit: (args) ->
    if args.name
      args.success displayMessage: false
    else
      options = {
        ajaxOptions: {
          type: 'put',
          dataType: 'json'
        },
        data: {
          event: { name: args.name }
        },
        error: args.error,
        success: args.success
      }

      @target.text args.name
      @target.editable 'submit', options

  success: (handler) ->
    @successHandler = handler

  afterSave: (e, params) =>
    @successHandler event: { name: params.newValue }

  init: ->
    @target.editable
      mode: 'inline'
      clear: false
      ajaxOptions:
        type: 'put'
        dataType: 'json'
      params: (params) ->
        event: {
          name: params.value
        }

    @target.on 'save', @afterSave
