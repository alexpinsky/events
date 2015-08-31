class @Publisher
  constructor: (args) ->
    @container = args.container

  # args; {event, success, error}
  publish: (args) ->
    onPublishSuccess = (data, textStatus, jqXHR) =>
      @publishedModal.show
        url: data.event.full_url
        done: =>
          @publishedModal.hide()
          args.success event: data.event

    onPublishClick = (data) =>
      $.ajax
        url: "/events/#{args.event.id}/publish"
        data: { url: data.url }
        type: 'PUT'
        dataType: 'json'
        success: onPublishSuccess
        error: (jqXHR, textStatus, errorThrown) =>
          Notification.display jqXHR.responseText, 'alert'
          args.error()

    @publishModal.show
      url:     args.event.url
      publish: onPublishClick
      cancel:  (=> @publishModal.hide() )

  # args; {event, success, error}
  unpublish: (args) ->
    $.ajax
      url: "/events/#{args.event.id}/unpublish"
      type: 'PUT'
      dataType: 'json'
      success: (data, textStatus, jqXHR) =>
        Notification.display data.message, 'notice'
        args.success event: data.event
      error: (jqXHR, textStatus, errorThrown) =>
        Notification.display jqXHR.responseText, 'alert'
        args.error()

  init: ->
    @publishModal = new PublishModal
      modal: @container.find('#publish-event')
    @publishModal.init()

    @publishedModal = new PublishedModal
      modal: @container.find('#event-published')
    @publishedModal.init()