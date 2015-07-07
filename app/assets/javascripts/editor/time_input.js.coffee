class @TimeInput
  constructor: (options = {}) ->
    @input     = options.input
    @bindInput = options.bindInput

  init: ->
    currentVal = @bindInput.val()
    time = currentVal.split(' ')[1]

    @input.val time
    @input.timepicker
      showDuration: true
      timeFormat: 'H:i'
    .on('changeTime', @onTimeChange)

  onTimeChange: (e) =>
    currentVal = @bindInput.val()
    date = currentVal.split(' ')[0]
    @bindInput.val "#{date || ''} #{@input.val()}"
