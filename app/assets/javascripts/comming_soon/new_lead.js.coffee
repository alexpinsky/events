class NewLead

  init: () ->
    $('.email-input').keyup @onKeyup
    $('.form').find('form').submit @onSubmit

  onKeyup: (e) ->
    input = $(e.target)
    if input.val().length > 0
      imgUrl = "https://s3-eu-west-1.amazonaws.com/events-assets-static/pages/comming_soon/images/btn_between.svg"
    else
      imgUrl = "https://s3-eu-west-1.amazonaws.com/events-assets-static/pages/comming_soon/images/btn_before.svg"
    $('.submit-btn').attr("src", imgUrl)
      

  onSubmit: (e) ->
    e.preventDefault()
    form = $(e.target)
    $.ajax
      type: "POST"
      dataType: "json"
      url: form.attr("action")
      data: form.serialize()
      complete: (data, status) ->
        $('.submit-btn').attr("src", "https://s3-eu-west-1.amazonaws.com/events-assets-static/pages/comming_soon/images/btn_after.svg")
        $('.email-input').val("")
        setTimeout (->
          $('.submit-btn').attr("src", "https://s3-eu-west-1.amazonaws.com/events-assets-static/pages/comming_soon/images/btn_before.svg")
        ), 1000

$ ->
  newLead = new NewLead
  newLead.init()