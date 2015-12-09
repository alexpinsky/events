class @Form
  constructor: (options = {}) ->
    @container   = options.container
    @listener    = options.listener
    @persistence = options.persistence

  init: (options = {}) ->
    @form = @container.find('form')
    @form.submit @onSubmit

    @nameInput = @container.find('input#event_name')

    accordion = new Accordion container: @container.find('.accordion'), persistence: @persistence
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

    @background = new BackgroundGallery
      container: @container.find('.background-section')
    @background.click @onBackgroundChange
    @background.init()

    @pics = new PicsSelector container: @container.find('.pics-section')
    @pics.add @onPicAdd
    @pics.remove @onPicRemove
    @pics.init()

    @info = new Information container: @container.find('.information')
    @info.syncClick @onSyncClick
    @info.init()

    event = options.event
    @updateFromEvent(event) unless event.isEmpty()
    ReactDOM.render(React.createElement(Pictures), @container.find('.pics-section')[0])

  themeClick: (handler) ->
    @themeHandler = handler

  updateFromEvent: (event) ->
    @text.updateFromEvent event
    @pics.updateFromEvent event

  updateName: (name) ->
    @nameInput.val name

  isNamePresent: ->
    @nameInput.val() != ''

  submit: (args) ->
    @successHandler = args.success
    @errorHandler   = args.error

    @updateName args.name

    @form.submit()

  destroy: ->

  onSubmit: (e) =>
    e.preventDefault()

    formObj = $(e.currentTarget)
    formURL = formObj.attr "action"
    formData = new FormData e.currentTarget

    Loader.on()
    $.ajax
      url: formURL
      type: 'POST'
      data: formData
      mimeType: "multipart/form-data"
      dataType: 'json'
      contentType: false
      cache: false
      processData: false
      success: (data, textStatus, jqXHR) =>
        @successHandler $.extend(data, {displayMessage: true})
      error: (jqXHR, textStatus, errorThrown) =>
        @errorHandler()
      complete: ->
        Loader.off()

    false # stop event propagation

  onThemeClick: (e) =>
    @themeHandler e

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

  onPicAdd: (e) =>
    @listener.onPicAdd e

  onPicRemove: (e) =>
    @listener.onPicRemove e

  onSyncClick: (state) =>
    @listener.onSyncClick state
