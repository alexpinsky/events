class @Preview
  constructor: (options = {}) ->
    @container = options.container

  init: (options = {}) ->
    event = options.event
    @updateFromEvent(event) unless event.isEmpty()
    @runSlideShow()

  runSlideShow: (options = {}) ->
    images = options.images || @container.find('.images')
    if images.data('slideshow')
      images.slick
        autoplay: true,
        arrows: false,
        mobileFirst: true

  stopSlideShow: (options = {}) ->
    images = options.images || @container.find('.images')
    images.slick 'unslick'

  destroy: ->

  updateFromEvent: (event) ->
    for id, val of event.texts()
      @updateText id, val

    for order, valObj of event.pics()
      @addPic order: order, url: valObj.url

  updateText: (id, val) =>
    textDisplay = @container.find("##{id}")

    if textDisplay.length == 1
      # single line
      textDisplay.text val
    else
      # multi line
      divs = ""
      textDisplay = @container.find(".#{id}")
      for word in val.split(' ')
        divs += "<div>#{word}</div>"
      textDisplay.html divs

  updateFont: (id, val) =>
    textDisplay = @container.find("##{id}")
    textDisplay = @container.find(".#{id}") if textDisplay.length != 1

    textDisplay.css("font-family", val)

  updateColor: (id, val) =>
    textDisplay = @container.find("##{id}")
    textDisplay = @container.find(".#{id}") if textDisplay.length != 1

    textDisplay.css("color", val)

  updateSize: (id, val) =>
    textDisplay = @container.find("##{id}")

    if textDisplay.length == 1
      # single line
      textDisplay.parent().css("font-size", "#{val}em")
    else
      # multi line
      textDisplay = @container.find(".#{id}")
      textDisplay.css("font-size", "#{val}em")

  updateBackground: (url) =>
    @container.find('.display').css('background', "url(#{url})")

  addPic: (e) =>
    images = @container.find('.images')

    if images.length == 1
      @stopSlideShow(images: images) if images.data('slideshow')
      images.find("#image-#{e.order}").remove()

      images.append "<img id='image-#{e.order}' src='#{e.url}'>"

      if images.children('img').length > 1
        images.data 'slideshow', true
        @runSlideShow(images: images)
      else
        images.data 'slideshow', false
    else
      @container.find("#image-#{e.order}").attr 'src', e.url

  removePic: (e) =>
    images = @container.find('.images')

    if images.length == 1
      @stopSlideShow(images: images) if images.data('slideshow')
      images.find("#image-#{e.order}").remove()

      if images.children('img').length > 1
        images.data 'slideshow', true
        @runSlideShow(images: images)
      else
        images.data 'slideshow', false
    else
      @container.find("#image-#{e.order}").attr 'src', ''
