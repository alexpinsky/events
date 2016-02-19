class @ChangesDelegator
  constructor: (options = {}) ->
    @event = options.event
    @view = options.view

  destroy: ->

  onTextChange: (id, val) =>
    @event.updateText id, val
    @view.updateText id, val

  onFontChange: (id, val) =>
    @event.updateFont id, val
    @view.updateFont id, val

  onColorChange: (id, val) =>
    @event.updateColor id, val
    @view.updateColor id, val

  onSizeChange: (id, val) =>
    @event.updateSize id, val
    @view.updateSize id, val

  onBackgroundChange: (url) =>
    @event.updateBackground url
    @view.updateBackground url

  onPicAdd: (e) =>
    @event.addPic e
    @view.addPic e

  onPicRemove: (e) =>
    @event.removePic e
    @view.removePic e

  onSyncClick: (state) =>
    if state == 'on'
      @view.addCalendar()
    else
      @view.removeCalendar()
