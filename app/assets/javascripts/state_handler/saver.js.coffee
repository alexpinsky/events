class @Saver
  constructor: (args) ->
    @container = args.container

  save: (args) ->
    event = args.event

    if event.name
      # when name is present perform quick save.
      onSuccess = (data) =>
        Notification.display(data.message, 'notice') if data.displayMessage
        args.success data

      args.submitable.submit
        name:    event.name
        success: onSuccess
        error:   args.error
    else
      # when name is blank, open save modal.
      onSuccess = (data) =>
        @savedModal.hide()
        args.success data

      showSavedModal = (data) =>
        @savedModal.show
          event:     data.event
          done:      onSuccess
          publish:   (->
            args.publish event: data.event
          )

      onSaveClick = (data) =>
        args.submitable.submit
          name:    data.name
          success: showSavedModal
          error:   args.error

      @saveModal.show save: onSaveClick, cancel: (=> @saveModal.hide())

  init: ->
    @saveModal = new SaveModal modal: @container.find('#save-event')
    @saveModal.init()

    @savedModal = new SavedModal modal: @container.find('#event-saved')
    @savedModal.init()