class @Editor
  @start: ->
    if window.currentEditor
      prevEditor = window.currentEditor
      prevEditor.destroy()
      prevEditor = null

    event = new Event persistence: new DOMPersistence
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
      container: @container.find('.modals')
      form:      @form
      event:     @event
    @saver.close            @onSaverClose
    @saver.error            @onSaverError
    @saver.afterSavePublish @onAfterSavePublish

    @saver.init()
    @form.init event: @event

    @publisher = new Publisher
      container: @container.find('')
    @publisher.close @onPublisherClose
    @publisher.init()

    @container.find('.save-wrapper .save').click @onSaveClick
    @container.find('').click                    @onPublishClick

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

    eventId = $('.event').data('event')

    if eventId
      # edit mode -> use event for display
      url = "/events/#{eventId}/edit"
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

  loadEvent: (args) ->
    $.ajax
      url: "/events/#{args.event_id}/edit"
      dataType: "script"

  onThemeClick: (e) =>
    @loadTheme e.category, e.theme

  onSaveClick: =>
    @saver.save success: (data) => @loadEvent data

  onPublishClick: =>
    @saver.save success: -> @onAfterSavePublish()

  onAfterSavePublish: =>
    @publisher.publish()

  onSaverError: (data) =>
    Notification.display 'Sorry... but something went wrong', 'alert'

  onSaverClose: (data) =>
    @loadEvent event_id: data.event_id

  onPublisherClose: =>
