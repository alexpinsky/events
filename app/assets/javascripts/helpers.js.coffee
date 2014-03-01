class @Helpers

  @displayAlert: (text, type) ->
    $(".flashes").append("<div data-alert class='alert-box " + type + " radius'>" + text + "<a href='#' class='close'>&times;</a></div>")
