class @Information
  constructor: (options = {}) ->
    @container = options.container

  init: ->
    checkbox = new Checkbox container: @container.find('.checkbox')
    checkbox.init()
    console.log @container.find('.time-section .inputs .time')

    @container.find('.time-section .inputs .time').timepicker
      showDuration: true
      timeFormat: 'g:ia'

    @container.find('.time-section .inputs .date').datepicker
      format: 'm/d/yyyy'
      autoclose: true

    @container.find('.time-section').datepair()