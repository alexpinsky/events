class @Publisher
  constructor: (args) ->
    @container = args.container

  init: ->
    @publishModal = new PublishModal
      modal:    @container.find '#publish-event'
    @publishModal.close   @onPublishModalClose
    @publishModal.publish @onPublishModalPublish
    @publishModal.init()

    @publishedModal = new PublishedModal
      modal:    @container.find '#event-published'
    @publishedModal.close @onPublishedModalClose
    @publishedModal.init()

  close: (handler) ->
    @closeHandler = handler

  publish: (args) ->
    @eventId = args.event_id
    @publishModal.show event_id: args.event_id

  unpublish: (args) ->
    $.ajax
      url: "/events/#{args.event_id}/unpublish"
      type: 'PUT'
      dataType: 'json'
      success: (data, textStatus, jqXHR) =>
        Notification.display 'Your event is private now', 'notice'
      error: (jqXHR, textStatus, errorThrown) =>
        Notification.display jqXHR.responseText, 'alert'

  onPublishModalPublish: (data) =>
    $.ajax
      url: "/events/#{@eventId}/publish"
      data: { url: data.url }
      type: 'PUT'
      dataType: 'json'
      success: (data, textStatus, jqXHR) =>
        @onPublishSuccess data.url
      error: (jqXHR, textStatus, errorThrown) =>
        Notification.display jqXHR.responseText, 'alert'

  onPublishModalClose: =>
    @publishModal.hide()

  onPublishedModalClose: =>
    @publishedModal.hide()
    @closeHandler event_id: @eventId

  onPublishSuccess: (url) =>
    @publishedModal.show url
