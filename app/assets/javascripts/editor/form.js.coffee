class @Form
  constructor: (options = {}) ->
    @container = options.container
    @listener = options.listener

  init: (options = {}) ->
    @form = @container.find('form')
    @form.submit @onSubmit

    accordion = new Accordion container: @container.find('.accordion')
    accordion.init()

    theme = new ThemeGallery container: @container.find('.gallery')
    theme.click @onThemeClick
    theme.init()

    @text = new TextEdit container: @container.find('.text-edit')
    @text.textChange @onTextChange
    @text.fontChange @onFontChange
    @text.colorChange @onColorChange
    @text.sizeChange @onSizeChange
    @text.init()

    @background = new BackgroundGallery container: @container.find('.background-section')
    @background.click @onBackgroundChange
    @background.init()

    event = options.event
    @updateFromEvent(event) unless event.isEmpty()

  themeClick: (handler) ->
    @handler = handler

  updateFromEvent: (event) ->
    @text.updateFromEvent event

  submit: ->
    @form.submit()

  destroy: ->

  onSubmit: (e) =>
    formObj = $(e.currentTarget)
    formURL = formObj.attr "action"
    formData = new FormData e.currentTarget

    console.log "formURL: #{formURL}"
    console.log "formData:"
    console.log formData

    $.ajax
      url: formURL
      type: 'POST'
      data: formData
      dataType: 'JSON'
      mimeType: "multipart/form-data"
      contentType: false
      cache: false
      processData: false
      success: (data, textStatus, jqXHR) =>
        console.log "success"
        console.log "data:"
        console.log data
        console.log "textStatus:"
        console.log textStatus
        console.log "jqXHR:"
        console.log jqXHR
      error: (jqXHR, textStatus, errorThrown) =>
        console.log "error"
        console.log "textStatus:"
        console.log textStatus
        console.log "jqXHR:"
        console.log jqXHR
        console.log "errorThrown:"
        console.log errorThrown

    e.preventDefault()

  onThemeClick: (e) =>
    @handler e

  onTextChange: (id, val) =>
    @listener.onTextChange id, val

  onFontChange: (id, val) =>
    @listener.onFontChange id, val

  onColorChange: (id, val) =>
    @listener.onColorChange id, val

  onSizeChange: (id, val) =>
    @listener.onSizeChange id, val

  onBackgroundChange: (url) =>
    @container.find('#background-image').val url
    @listener.onBackgroundChange url

