class @CalendarElement
  constructor: (options = {}) ->
    @calendarObj = options.calendarObj

  init: ->
    @calendarObj.find('.datepicker').each (i, obj) ->
      $(obj).fdatetimepicker()
    switchObj = @calendarObj.find('#calendar-switch')
    switchObj.change @onSwitchChange
    switchObj.trigger("change")

  check: (handler) ->
    @checkHandler = handler

  uncheck: (handler) ->
    @uncheckHandler = handler

  onSwitchChange: (e) =>
    if $(e.currentTarget).is(":checked")
      @calendarObj.find('.details-wrapper').slideDown()
      @checkHandler() if @checkHandler
    else
      @calendarObj.find('.details-wrapper').slideUp()
      @uncheckHandler() if @uncheckHandler

  