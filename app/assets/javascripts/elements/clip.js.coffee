class @Clip
  constructor: (args) ->
    @target = args.target
    @clipDataHandler  = args.clipData
    @afterClipHandler = args.afterClip

  init: ->
    ZeroClipboard.config
      swfPath: "http://s3-eu-west-1.amazonaws.com/events-assets-static/shared/ZeroClipboard.swf"
      forceHandCursor: true

    client  = new ZeroClipboard @target

    client.on 'ready', ((readyEvent) =>

      client.on 'copy', ((event) =>
        event.clipboardData.setData 'text/plain', @clipDataHandler()
        @afterClipHandler()
      )
    )
