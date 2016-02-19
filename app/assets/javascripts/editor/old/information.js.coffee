class @Information
  constructor: (options = {}) ->
    @container = options.container

  init: ->
    checkbox = new Checkbox container: @container.find('.checkbox')
    checkbox.click @onClick
    checkbox.init()

    @initInputs()

  syncClick: (handler) ->
    @handler = handler

  initInputs: ->
    startTimeHidden = @container.find('.time-section .inputs .start-time.hidden-input')
    endTimeHidden = @container.find('.time-section .inputs .end-time.hidden-input')

    startDate = new DateInput
      input: @container.find('.time-section .inputs .date.start')
      bindInput: startTimeHidden
    startDate.init()

    endDate = new DateInput
      input: @container.find('.time-section .inputs .date.end')
      bindInput: endTimeHidden
    endDate.init()

    startTime = new TimeInput
      input: @container.find('.time-section .inputs .time.start')
      bindInput: startTimeHidden
    startTime.init()

    endTime = new TimeInput
      input: @container.find('.time-section .inputs .time.end')
      bindInput: endTimeHidden
    endTime.init()

    @container.find('.time-section').datepair()

  onClick: (state) =>
    syncState = if state == 'checked' then 'on' else 'off'
    @handler syncState