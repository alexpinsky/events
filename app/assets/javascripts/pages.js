$(document).ready(function() {

  // init responsive nav
  responsiveNav(".nav-collapse");

  var options = {
    autoplay: true,
    arrows: false,
    mobileFirst: true,
    pauseOnHover: false,
    draggable: false,
    speed: 2000
  }
  $('.slideshow').slick(options);
  $('.slideshow-fade').slick($.extend(options, {
    fade: true
  }));

  $('.welcome .images').css('display', 'block');
});