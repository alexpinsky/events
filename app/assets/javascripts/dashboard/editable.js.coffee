class @Editable
  constructor: (args) ->
    @target = args.target

  save: (handler) ->
    @saveHandler = handler

  submit: ->

  onSave: (e, params) =>
    @saveHandler newName: params.newValue

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

    @target.on 'save', @onSave
