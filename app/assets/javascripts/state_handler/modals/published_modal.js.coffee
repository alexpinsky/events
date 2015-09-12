class @PublishedModal
  constructor: (args) ->
    @modal = args.modal

  init: ->
    @input   = @modal.find('.url-wrapper input')
    @copyBtn = @modal.find('.modal-actions .copy')

    clip = new Clip
      target:    @copyBtn
      clipData:  @clipData
      afterClip: @afterClip
    clip.init()

    @modal.find('.modal-actions .done').click @onDoneClick
    @copyBtn.click @onCopyClick

  show: (args) ->
    @input.val args.url
    @doneHandler = args.done

    @modal.modal clickClose: false

  hide: ->
    $.modal.close()

  clipData: =>
    @input.val()

  afterClip: =>
    @copyBtn.addClass 'link-copied'
    setTimeout((=> @copyBtn.removeClass('link-copied')), 1000)

  onCopyClick: =>
    @input.select()

  onDoneClick: =>
    @doneHandler()

