class @Publisher
  constructor: (args) ->
    @container = args.container
    @rootUrl   = args.root_url
    @url       = args.url

  init: ->
    @publishModal = new PublishModal
      modal:    @container.find '#publish-event'
      root_url: @rootUrl
      url:      @url
    @publishModal.close   @onPublishModalClose
    @publishModal.publish @onPublishModalPublish

    @publishedModal = new PublishedModal
      modal:    @container.find '#event-published'
      root_url: @root_url
    @publishModal.close @onPublishedModalClose

  close: (handler) ->
    @closeHandler = handler

  publish: (args) ->
    @eventId = args.event_id
    @publishModal.show event_id: args.event_id

  unpublish: (args) ->
    $.ajax
      url: "/events/#{args.event_id}/publish"
      type: 'PUT'
      dataType: 'json'
      success: (data, textStatus, jqXHR) =>
        Notification.display 'Your event is private now', 'notice'
      error: (jqXHR, textStatus, errorThrown) =>
        Notification.display textStatus, 'alert'

  onPublishModalClose: (data) =>
    $.ajax
      url: "/events/#{@eventId}/publish"
      data: { url: data.url }
      type: 'PUT'
      dataType: 'json'
      success: (data, textStatus, jqXHR) =>
        @onPublishSuccess data.url
      error: (jqXHR, textStatus, errorThrown) =>
        Notification.display textStatus, 'alert'

  onPublishSuccess: (data) =>
    @publishedModal.show url: data.url
