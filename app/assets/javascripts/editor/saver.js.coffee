class Saver
  constructor: (arguments) ->
    @container = arguments.container
    @event     = arguments.event
    @form      = arguments.form

  init: ->
    @form.submitSuccess @onSubmitSuccess
    @form.submitError   @onSubmitError

    @saveModal = new SaveModal container: @container.find('saveModal')
    @saveModal.save   @onSaveModalSave
    @saveModal.cancel @onSaveModalCancel

    @savedModal = new SavedModal container: @container.find('savedModal')
    @savedModal.pubilsh @onSavedModalPublish
    @savedModal.done    @onSavedModalDone

  save: ->
    if @event.isNameless
      @saveModal.show()
    else
      @form.submit()

  success: (handler) ->
    @successHandler = handler

  error: (handler) ->
    @errorHandler = handler

  publish: (handler) ->
    @publishHandler = handler

  onSubmitSuccess: (data) =>
    Notification.display 'Your event was saved!', 'notice'
    @savedModal.show()
    @successHandler data

  onSubmitError: =>
    Notification.display 'Sorry... but something went wrong', 'alert'
    @errorHandler()

  onSaveModalSave: (data) =>
    @form.updateName data.name
    @save()

  onSaveModalCancel: =>
    @saveModal.hide()

  onSavedModalDone: =>
    @savedModal.hide()

  onSavedModalPublish: =>
    @publishHandler()