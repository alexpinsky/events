class @Editor
  @start: ->
    if window.currentEditor
      prevEditor = window.currentEditor
      prevEditor.destroy()
      prevEditor = null

    event = new Event id: $('.event').data('event'), persistence: new DOMPersistence
    event.init()

    editor = new Editor container: $('.page-wrapper.editor'), event: event
    editor.init()

    window.currentEditor = editor

  constructor: (options = {}) ->
    @container = options.container
    @event = options.event

  init: ->
    @initVendors()

    @preview = new Preview container: @container.find('.preview-wrapper')
    @preview.init event: @event

    @delegator  = new ChangesDelegator
      event: @event
      view: @preview

    @form = new Form
      container: @container.find('.form-wrapper')
      listener:  @delegator
    @form.themeClick @onThemeClick

    @saver = new Saver
      container: @container.find('.modals .save-modals')
      form:      @form
      event:     @event
    @saver.close @onSaverClose
    @saver.error @onSaverError
    @saver.afterSavePublish @onAfterSavePublish

    @saver.init()
    @form.init event: @event

    publishContainer = @container.find('.modals .publish-modals')
    @publisher = new Publisher
      container: publishContainer
    @publisher.close @onPublisherClose
    @publisher.afterUnpublish @afterUnpublish
    @publisher.init()

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

  loadEvent: ->
    $.ajax
      url: "/events/#{@event.id}/edit"
      dataType: "script"

  onThemeClick: (e) =>
    @loadTheme e.category, e.theme

  onSaveClick: =>
    @saver.save success: @afterEventSave

  afterEventSave: (data) =>
    Notification.display 'Your event was saved!', 'notice'
    @event.id = data.event_id
    @loadEvent()

  onPublishClick: =>
    @saver.save success: (data) => @onAfterSavePublish data

  onUnpublishClick: =>
    @publisher.unpublish event_id: @event.id

  onAfterSavePublish: (data) =>
    @publisher.publish event_id: data.event_id, root_url: @rootUrl

  onSaverError: (data) =>
    Notification.display 'Sorry... but something went wrong', 'alert'

  onSaverClose: (data) =>
    @afterEventSave data

  onPublisherClose: (data) =>
    @loadEvent()

  afterUnpublish: =>
    @loadEvent()
