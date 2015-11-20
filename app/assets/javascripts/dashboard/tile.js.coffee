class @Tile
  constructor: (args) ->
    @container    = args.container
    @event        = args.event
    @stateHandler = args.stateHandler
    @editable     = new Editable target: @container.find('.event-name')
    @urlInput     = @container.find('.url-wrapper input')

  init: ->
    @editable.success @onSaved
    @editable.init()

    @input   = @container.find('.url-wrapper input')
    @copyBtn = @container.find('.url-wrapper .copy-icon')

    clip = new Clip
      target:    @copyBtn
      clipData:  @clipData
      afterClip: @afterClip
    clip.init()

    @container.find('.actions .publish').click   @onPublishClick
    @container.find('.actions .unpublish').click @onUnpublishClick
    @copyBtn.click @onCopyClick

  clipData: =>
    @input.val()

  afterClip: =>
    @copyBtn.addClass 'link-copied'
    setTimeout((=> @copyBtn.removeClass('link-copied')), 1000)

  onCopyClick: =>
    @input.select()

  onPublishClick: (e) =>
    @stateHandler.saveAndPublish
      event:      @event
      submitable: @editable
      saved:      @onSaved
      published:  @onPublished
      error:      @onPublishError

  onUnpublishClick: (e) =>
    @stateHandler.unpublish
      event:   @event
      success: @onUnpublished
      error:   @onUnpublishError

  onPublished: (data) =>
    @event.url = data.event.url
    @updateIcon 'unpublish'
    @updateUrl data.event.full_url

  onUnpublished: (data) =>
    @updateIcon 'publish'
    @updateUrl data.event.full_url

  onPublishError: (data) =>
  onUnpublishError: (data) =>

  onSaved: (data) =>
    @event.name = data.event.name

  updateUrl: (url) =>
    @urlInput.val url

  updateIcon: (type) =>
    if type == 'publish'
      currentType = 'unpublish'
      callBack = @onPublishClick
    else
      currentType = 'publish'
      callBack = @onUnpublishClick

    @container.find(".actions .#{currentType}-wrapper").replaceWith @render(type)
    @container.find(".actions .#{type}").click callBack

  render: (type) =>
    "<div class='#{type}-wrapper'>
      <div class='#{type}''></div>
      <div class='text'>#{type.toUpperCase()}</div>
    </div>"