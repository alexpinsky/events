class @StateHandler
  constructor: (args) ->
    @container = args.container

    @saver = new Saver container: @container
    @saver.init()

    @publisher = new Publisher container: @container
    @publisher.init()

  save: (args) ->
    @saver.save
      event:      args.event
      submitable: args.submitable
      success:    args.success
      publish:    args.publish
      error:      args.error

  saveAndPublish: (args) ->
    event = args.event

    baseOptions = {
      event:      event
      submitable: args.submitable
      error:      args.error
    }

    publishCallback = () =>
      @publish
        event:   event
        success: args.published
        error:   args.error

    if event.name
      # when the event has a name, it will do quick save and go to publish.
      options = { success: publishCallback }
    else
      # when the event has no name, it will do save with a name. To publish, the user have to press the publish again.
      options = { publish: publishCallback, success: args.saved }

    @save $.extend(baseOptions, options)

  unpublish: (args) ->
    @publisher.unpublish
      event:   args.event
      success: args.success
      error:   args.error

  publish: (args) ->
    @publisher.publish
      event:   args.event
      success: args.success
      error:   args.error