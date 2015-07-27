class @PublishModal
  constructor: (args) ->
    @modal   = args.modal
    @rootUrl = args.root_url
    @url     = args.url

  close: (handler) ->

  publish: (handler) ->

  show: (args) ->
    console.log "root_url: #{@rootUrl}"
    console.log "url: #{@url}"
    console.log args
    @modal.modal clickClose: false

