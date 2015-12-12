class @Editor
  @start: ->
    if window.currentEditor
      prevEditor = window.currentEditor
      prevEditor.destroy()
      prevEditor = null

    persistence = new DOMPersistence
    event = new Event
      data: $('.event').data('json')
      persistence: persistence
    event.init()

    editor = new Editor container: $('.page-wrapper.editor'), event: event, persistence: persistence
    editor.init()

    window.currentEditor = editor

  constructor: (options = {}) ->
    @container   = options.container
    @event       = options.event
    @persistence = options.persistence

  init: ->
    @initVendors()

    @stateHandler = new StateHandler container: @container

    @preview = new Preview container: @container.find('.preview-wrapper')
    @preview.init event: @event

    @delegator  = new ChangesDelegator
      event: @event
      view: @preview
    @form = new Form
      container:   @container.find('.form-wrapper')
      listener:    @delegator
      persistence: @persistence
    @form.themeClick @onThemeClick
    @form.init event: @event

    @container.find('.save-wrapper .save').click @onSaveClick
    @container.find('.publish-wrapper .publish').click @onPublishClick
    @container.find('.unpublish-wrapper .unpublish').click @onUnpublishClick

  initVendors: ->
    addthisevent.refresh()

  destroy: ->
    @preview.destroy()
    @preview = null
    @delegator.destroy()
    @delegator = null
    @form.destroy()
    @form = null

  loadTheme: (category, theme) ->
    @event.save()

    if @event.id()
      # edit mode -> use event for display
      url = "/events/#{@event.id()}/edit"
    else
      # new mode -> use the theme for display
      url = '/events/new'

    Loader.on()
    $.ajax
      url: url
      data: { category_id: category, theme_id: theme }
      dataType: "script"
      complete: ->
        Loader.off()

  loadEvent: (event) ->
    $.ajax
      url: "/events/#{event.id}/edit"
      dataType: "script"

  onThemeClick: (e) =>
    @loadTheme e.category, e.theme

  onSaveClick: =>
    onSavePublishClick = (args) =>
      @stateHandler.publish
        event:   args.event
        success: @publishSuccessCallback
        error:   @publishErrorCallback

    @stateHandler.save
      event:      @event.getData()
      submitable: @form
      success:    @saveSuccessCallback
      publish:    onSavePublishClick
      error:      @saveErrorCallback

  onPublishClick: (e) =>
    @stateHandler.saveAndPublish
      event:      @event.getData()
      submitable: @form
      saved:      @saveSuccessCallback
      published:  @publishSuccessCallback
      error:      @publishErrorCallback

  onUnpublishClick: (e) =>
    @stateHandler.unpublish
      event:   @event.getData()
      success: @unpublishSuccessCallback
      error:   @unpublishErrorCallback

  # data: {event}
  saveSuccessCallback: (data) =>
    @loadEvent data.event

  saveErrorCallback: (data) =>
    Notification.display data.message, 'alert'

  # data: {event}
  publishSuccessCallback: (data) =>
    window.location.href = '/events'

  publishErrorCallback: (data) =>

  # data: {event}
  unpublishSuccessCallback: (data) =>
    @loadEvent data.event
  unpublishErrorCallback: (data) =>
