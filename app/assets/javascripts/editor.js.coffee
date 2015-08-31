class @Editor
  @start: ->
    if window.currentEditor
      prevEditor = window.currentEditor
      prevEditor.destroy()
      prevEditor = null

    eventObj = $('.event')
    event = new Event
      id:   eventObj.data('id')
      name: eventObj.data('name')
      url:  eventObj.data('url')
      persistence: new DOMPersistence
    event.init()

    editor = new Editor container: $('.page-wrapper.editor'), event: event
    editor.init()

    window.currentEditor = editor

  constructor: (options = {}) ->
    @container = options.container
    @event = options.event

  init: ->
    @initVendors()

    @stateHandler = new StateHandler container: @container

    @preview = new Preview container: @container.find('.preview-wrapper')
    @preview.init event: @event

    @delegator  = new ChangesDelegator
      event: @event
      view: @preview

    @form = new Form
      container: @container.find('.form-wrapper')
      listener:  @delegator
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

    if @event.id
      # edit mode -> use event for display
      url = "/events/#{@event.id}/edit"
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
    savedPublishClick = (args) =>
      @stateHandler.publish
        event:   args.event
        success: @onPublished
        error:   @onPublishError

    @stateHandler.save
      event:      @event
      submitable: @form
      success:    @onSaved
      publish:    savedPublishClick
      error:      @onSaveError

  onPublishClick: (e) =>
    @stateHandler.saveAndPublish
      event:      @event
      submitable: @form
      saved:      @onSaved
      published:  @onPublished
      error:      @onPublishError

  onUnpublishClick: (e) =>
    @stateHandler.unpublish
      event:   @event
      success: @onUnpublished
      error:   @onUnpublishError

  # data: {event}
  onPublished: (data) =>
    @loadEvent data.event

  # data: {event}
  onSaved: (data) =>
    @loadEvent data.event

  onUnpublished: (data) =>
    @loadEvent data.event

  onPublishError: (data) =>
  onSaveError: (data) =>
  onUnpublishError: (data) =>