class Editor
  constructor: (options={})->
    @editor = options.editor
    @preview = options.preview

  init: ->
    @initTemplates()
    @initText()
    # @initAppearanceListeners()
    # @initUploaders()
    # @initAppearanceListeners()

  initTemplates: ->
    element = new SliderElement
      slider_obj: @editor.find('.slider-element')
    element.themeClick @onThemeClick
    element.init()
    
  initText: ->
    element = new TextElement
      editor: @editor,
      preview: @preview
    element.init()

  onThemeClick: (args = {}) =>
    $.ajax
      url: "/events/new"
      data: { category_id: args.category, theme_id: args.theme }
      dataType: "script"

  initOldAppearanceListeners: ->
    # background image
    @editor.find(".background_btn").on "click", (e) =>
      targe_obj = $(e.currentTarget)
      background_url = targe_obj.data('url')
      background_name = targe_obj.data('name')
      @preview.css("background-image", 'url(' + background_url + ')')
      @editor.find("#background_image").val(background_name)
    # font family
    @editor.find("select#font_family").on "change", (e) =>
      @preview.find(".font_family").each (i, obj) ->
        $(obj).css("font-family", $(e.currentTarget).val() )
    # font color
    @editor.find('input.minicolors').minicolors 
      defaultValue: '#ffffff'
      change: (hex, opacity) =>
        @preview.find(".font_color").each (i, obj) ->
          $(obj).css("color", hex )

  oldInitTextListeners: ->
    # primary text
    primary_text_input = @editor.find("#event_primary_text")
    primary_text_input.on "keyup", (e) =>
      @preview.find("#event_primary_text").text(primary_text_input.val())
    # secondary text
    secondary_text_input = @editor.find("#event_secondary_text")
    secondary_text_input.on "keyup", (e) =>
      @preview.find("#event_secondary_text").text(secondary_text_input.val())
    # extra text
    extra_text_input = @editor.find("#event_extra_text")
    extra_text_input.on "keyup", (e) =>
      @preview.find("#event_extra_text").text(extra_text_input.val())
    # datepickers
    @editor.find('.datepicker').each (i, obj) ->
      $(obj).fdatetimepicker()

  initUploaders: ->
    form_object = @editor.find('#event_form')
    form_object.find(".fileupload").each (i, element) =>
      obj = $(element)
      if obj.attr("id") == "image_file"
        @initImageUpload(obj)
      else
        @initAudioUpload(obj)

  initImageValidators: (obj) ->
    obj.fileValidator
      maxSize: '1m',
      type: 'image',
      onInvalid: (validationType, file) ->
        file['invalid'] = true

  initImageUpload: (obj) ->
    @initImageValidators(obj)
    obj.fileupload
      dataType: "json"
      maxNumberOfFiles: 5
      add: (e, data) ->
        file = data.files[0]
        form_object = $('#event_form')
        if typeof @num_of_files == 'undefined'
          @num_of_files = data.originalFiles.length
          form_object.find("#first_image").val("true")
          form_object.find("#images_spinner").show()
        else
          form_object.find("#first_image").val("false")
        types = /(\.|\/)(gif|jpe?g|png)$/i
        if file['invalid']
          @num_of_files--
          if (@num_of_files == 0)
            $('#event_form').find("#images_spinner").hide()
          Helpers.displayAlert("#{file.name} is too big (should be at most 1 MB)", 'alert')
        else if types.test(file.type) || types.test(file.name)
          form_object.find("#file_type").val("image")
          data.submit()
        else
          @num_of_files--
          if (@num_of_files == 0)
            $('#event_form').find("#images_spinner").hide()
          Helpers.displayAlert("#{file.name} is not a gif, jpeg, or png image file", "alert")
      done: (e, data) ->
        if data.result.success
          Helpers.displayAlert(data.result.success, "success")
        else if data.result.error
          Helpers.displayAlert(data.result.error, "alert")
      always: (e, data) ->
        @num_of_files--
        if (@num_of_files == 0)
          preview_obj = $("#preview")
          user_id = preview_obj.data("user")
          event_id = preview_obj.data("event")
          reload_url = "/users/" + user_id + "/events/" + event_id + "/reload_preview"
          $.ajax
            url: reload_url
            dataType: "script"
            complete: (obj, text) ->
              $('#event_form').find("#images_spinner").hide()

  initAudioUpload: (obj) ->
    obj.fileupload
      dataType: "json"
      maxNumberOfFiles: 1
      add: (e, data) ->
        types = /(\.|\/)(mp3)$/i
        file = data.files[0]
        if types.test(file.type) || types.test(file.name)
          form_object = $('#event_form')
          form_object.find("#file_type").val("audio")
          form_object.find("#song_spinner").show()
          data.submit()
        else
          Helpers.displayAlert("#{file.name} is not a mp3 file", "alert")
      done: (e, data) ->
        if data.result.success
          Helpers.displayAlert(data.result.success, "success")
        else if data.result.error
          Helpers.displayAlert(data.result.error, "alert")
      always: (e, data) ->
        $('#event_form').find("#song_spinner").hide()

$ ->
  editor = new Editor
    editor: $("#editor"), 
    preview: $("#preview")
  editor.init()