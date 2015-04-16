class @NameEditor
  
  constructor: (options = {}) ->
    @container = options.container
    @editIcon = @container.find('.edit-icon')

  init: ->
    @initEditable()

  initEditable: ->
    @container.find(".event-name").editable
      mode: 'inline'
      clear: false
      ajaxOptions:
        type: 'put'
        dataType: 'json'