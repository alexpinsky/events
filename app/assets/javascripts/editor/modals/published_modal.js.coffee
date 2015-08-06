class @PublishedModal
  constructor: (args) ->
    @modal = args.modal

  init: ->
    @input   = @modal.find('.url-wrapper input')
    @copyBtn = @modal.find('.modal-actions .copy')
    @client  = new ZeroClipboard @copyBtn

    @client.on 'ready', ((e) =>
      @client.on 'copy', ((e) =>
        e.clipboardData.setData 'text/plain', @input.val()
      )
    )

    @modal.find('.modal-actions .done').click @onDoneClick
    @copyBtn.click @onCopyClick

  close: (handler) ->
    @closeHandler = handler

  show: (url) ->
    @input.val url
    @modal.modal clickClose: false

  hide: ->
    $.modal.close()

  onCopyClick: =>
    @input.select()

  onDoneClick: =>
    @closeHandler()

