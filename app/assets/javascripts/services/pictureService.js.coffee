class @PictureService

  upload: (args) ->
    Q.Promise((resolve, reject, notify) =>
      fileInput = $('.cloudinary-fileupload')

      fileInput.bind 'cloudinarydone', ((e, data) ->
        fileInput.unbind 'cloudinarydone'
        fileInput.unbind 'fileuploadfail'
        fileInput.unbind 'fileuploadprogress'

        resolve data.result.url
      )

      fileInput.bind 'fileuploadfail', ((e, data) ->
        reject data
      )

      fileInput.bind 'fileuploadprogress', ((e, data) ->
        notify data
      )

      fileInput.click()
    )

  delete: (args) ->
