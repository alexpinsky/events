$(document).ready(function() {

  // init responsive nav
  responsiveNav(".nav-collapse");

  // init images slideshow
  $('.slideshow').slick({
    autoplay: true,
    arrows: false,
    mobileFirst: true,
    pauseOnHover: false
  });
  $('.slideshow-wrapper').css('display', 'block');
});