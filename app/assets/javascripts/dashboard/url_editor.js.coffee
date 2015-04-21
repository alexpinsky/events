class @UrlEditor
  
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
          url: params.value
        }