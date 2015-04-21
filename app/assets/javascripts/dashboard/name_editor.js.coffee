class @NameEditor
  
  constructor: (options = {}) ->
    @container = options.container
    @editable = options.editable

  init: ->
    @editable.editable
      mode: 'inline'
      clear: false
      ajaxOptions:
        type: 'put'
        dataType: 'json'
      params: (params) ->
        event: {
          name: params.value
        }
        