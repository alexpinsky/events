class @BackgroundElement
  constructor: (options = {}) ->
    @backgroundObj = options.backgroundObj

  init: ->
    @backgroundObj.find('a.th').click @onBackgroundClick
      
  onBackgroundClick: (e) =>
    e.preventDefault()
    target = $(e.currentTarget)
    @handler
      backgroundUrl: target.data('url')
      backgroundName: target.data('name')

  backgroundClick: (handler) =>
    @handler = handler