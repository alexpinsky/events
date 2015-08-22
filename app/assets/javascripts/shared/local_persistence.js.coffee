class @LocalPersistence
  getData: ->
    data = localStorage['data']
    JSON.parse data if data

  saveData: (data) ->
    localStorage.setItem 'data', JSON.stringify data

  clear: ->
    localStorage.clear()