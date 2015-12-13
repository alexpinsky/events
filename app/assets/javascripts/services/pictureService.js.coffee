class @PictureService
  constructor: (args) ->
    @uploadInput = $('.cloudinary-fileupload')

  upload: (args) ->
    console.log 'upload'
    Q.Promise( (resolve, reject, notify) ->
      @uploadInput.bind 'cloudinarydone', onDone
      @uploadInput.bind 'fileuploadprogress', onProgress
      @uploadInput.click()

      onDone: (e, data) ->
        # console.log data
        console.log data.url
        console.log data['url']
        if data.url
          resolve data.url
        else
          reject()

      onProgress: (e, data) ->
        console.log data.loaded
        console.log data.total
        notify data
    )

  delete: (args) ->
