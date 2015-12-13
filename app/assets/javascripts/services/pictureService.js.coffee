class @PictureService
  constructor: (args) ->
    @uploadInput = $('.cloudinary-fileupload')
    @uploadInput2 = $('.cloudinary-fileupload.second')

  upload: (args) ->
    if @second
      input = @uploadInput2
    else
      @second = true
      input = @uploadInput

    Q.Promise((resolve, reject, notify) ->
      input.bind 'cloudinarydone', ((e, data) ->
        $(this).remove()
        resolve data.result.url
      )
      input.bind 'fileuploadfail', ((e, data) ->
        reject data
      )
      input.bind 'fileuploadprogress', ((e, data) ->
        notify data
      )
      input.click()
    )

  delete: (args) ->
