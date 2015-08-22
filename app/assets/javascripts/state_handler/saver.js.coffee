class @Saver
  constructor: (args) ->
    @container = args.container

  save: (args) ->
    event = args.event
    @successHandelr

    if event.name
      onSuccess = (data) =>
        @savedModal.show
          close: 
          publish:


      args.submitable.submit
        success: onSuccess
        error:   args.error
    else
      

  init: ->
    @saveModal = new SaveModal modal: @container.find('#save-event')
    @saveModal.init()

    @savedModal = new SavedModal modal: @container.find('#event-saved')
    @savedModal.init()

  onSaveModalSave: (data) =>

  onSaveModalClose: =>
    @saveModal.hide()

  onSavedModalPublish: =>

  onSavedModalClose: =>
    @savedModal.hide()
