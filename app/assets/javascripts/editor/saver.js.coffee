class @Saver
  constructor: (args) ->
    @container = args.container
    @event     = args.event
    @form      = args.form

  init: ->
    @form.submitError @onSubmitError

    @saveModal = new SaveModal modal: @container.find('#save-event')
    @saveModal.save   @onSaveModalSave
    @saveModal.close  @onSaveModalClose
    @saveModal.init()

    @savedModal = new SavedModal modal: @container.find('#event-saved')
    @savedModal.publish @onSavedModalPublish
    @savedModal.close   @onSavedModalClose
    @savedModal.init()

  close: (handler) ->
    @closeHandler = handler

  error: (handler) ->
    @errorHandler = handler

  afterSavePublish: (handler) ->
    @publishHandler = handler

  save: (args) ->
    if @form.isNamePresent()
      @submit callback: (data) ->
        Notification.display 'Your event was saved!', 'notice'
        args.success data
    else
      @saveModal.show()

  submit: (args) ->
    @form.submit success: (data) -> args.callback data

  onSubmitError: =>
    @errorHandler()

  onSaveModalSave: (data) =>
    @form.updateName data.name
    @submit callback: (data) =>
      @savedModal.show()

  onSaveModalClose: =>
    @saveModal.hide()

  onSavedModalClose: =>
    @savedModal.hide()
    @closeHandler()

  onSavedModalPublish: =>
    @publishHandler()