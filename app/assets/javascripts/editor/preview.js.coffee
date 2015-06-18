class @Preview
  constructor: (options = {}) ->
    @container = options.container

  init: (options = {}) ->
    event = options.event
    @updateFromEvent(event) unless event.isEmpty()

  destroy: ->

  updateFromEvent: (event) ->
    for id, val of event.texts()
      @updateText id, val

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
    wrapper = @container.find("#image-wrapper-#{e.order}")

    if !wrapper[0]
      images = @container.find('.images').append "<div id='image-wrapper-#{e.order}' style='width: inherit; height: inherit;'></div>"
      @addPic e
      return

    images = @container.find('.images')
    if images && images.children().length > 1
      images.data 'slideshow', true
      images.slick
        autoplay: true,
        arrows: false,
        mobileFirst: true

    wrapper.html "<img src='#{e.url}'>"
