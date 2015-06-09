class @LocalPersistence
  getData: ->
    data = localStorage['data']
    JSON.parse data if data

  storeData: (data) ->
    localStorage.setItem JSON.stringify data

  clean: ->
    localStorage.removeItem['data']