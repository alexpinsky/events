class @Preview
  constructor: (options = {}) ->
    @container = options.container

  updateText: (id, val) =>
    @container.find("##{id}").text val

  updateFont: (id, val) =>
    @container.find("##{id}").css("font-family", val)

  updateColor: (id, val) =>
    @container.find("##{id}").css("color", val)

  updateSize: (id, val) =>
    @container.find("##{id}").parent().css("font-size", "#{val}em")
