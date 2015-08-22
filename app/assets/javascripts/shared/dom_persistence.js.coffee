class @DOMPersistence
  getData: ->
    data = $('body').data 'data'

  saveData: (data) ->
    $('body').data 'data', data

  clear: ->
    $('body').data 'data', null