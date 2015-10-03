$(document).ready(function() {

  // init responsive nav
  responsiveNav(".nav-collapse");

  // init images slideshow
  $('.slideshow').slick({
    autoplay: true,
    arrows: false,
    mobileFirst: true,
    pauseOnHover: false,
    draggable: false,
    speed: 1000
  });
  $('.images').css('display', 'block');
});