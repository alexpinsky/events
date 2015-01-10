class NewLead

  init: () ->
    $('.main-wrapper').find('form').submit @onSubmit

  onSubmit: (e) ->
    e.preventDefault()
    form = $(e.target)
    $.ajax
      type: "POST"
      dataType: "script"
      url: form.attr("action")
      data: form.serialize()
      complete: (data, status) ->
        form.find('.submit-btn').attr("src", "https://s3-eu-west-1.amazonaws.com/events-assets-static/pages/comming_soon/images/button_affter.svg")


$ ->
  newLead = new NewLead
  newLead.init()