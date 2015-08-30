class @PublishedModal
  constructor: (args) ->
    @modal = args.modal

  init: ->
    @input   = @modal.find('.url-wrapper input')
    @copyBtn = @modal.find('.modal-actions .copy')
    ZeroClipboard.config swfPath: "http://s3-eu-west-1.amazonaws.com/events-assets-static/shared/ZeroClipboard.swf"
    @client  = new ZeroClipboard @copyBtn

    @client.on 'ready', ((e) =>
      @client.on 'copy', ((e) =>
        e.clipboardData.setData 'text/plain', @input.val()
      )
    )

    @modal.find('.modal-actions .done').click @onDoneClick
    @copyBtn.click @onCopyClick

  show: (args) ->
    @input.val args.url
    @doneHandler = args.done

    @modal.modal clickClose: false

  hide: ->
    $.modal.close()

  onCopyClick: =>
    @input.select()

  onDoneClick: =>
    @doneHandler()

