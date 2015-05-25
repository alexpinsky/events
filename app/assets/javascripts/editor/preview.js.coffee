class @Preview
  constructor: (options = {}) ->
    @container = options.container

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
      console.log divs
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