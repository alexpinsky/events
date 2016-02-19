class @DateInput
  constructor: (options = {}) ->
    @input     = options.input
    @bindInput = options.bindInput

  init: ->
    currentVal = @bindInput.val()
    date = currentVal.split(' ')[0] if currentVal

    @input.val date
    @input.datepicker
      format: 'yyyy-mm-dd'
      autoclose: true
    .on('changeDate', @onDateChange)

  onDateChange: (e) =>
    currentVal = @bindInput.val()
    time = currentVal.split(' ')[1]
    @bindInput.val "#{@input.val()} #{time || ''}"
