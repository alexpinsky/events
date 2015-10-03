//= require jquery
//= require jquery_ujs
//= require slick.min

$(document).ready(function() {
  // init images slideshow
  var options = {
    autoplay: true,
    arrows: false,
    mobileFirst: true,
    pauseOnHover: false,
    draggable: false,
    speed: 1000
  }

  $('.slideshow').slick(options);
  $('.slideshow-dots').slick($.extend(options, {
    dots: true,
    customPaging: function(slider, i) { return '' }
  }));
  // $('.images').css('display', 'block');
});