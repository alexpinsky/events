//= require jquery
//= require jquery_ujs
//= require initializers
//= require slick.min

var stretchDisplay = function() {
  // starch background -  20 for display padding-bottom, 25 for footer height
  $('.display').css('min-height', $(window).height() - 20 - 25);
};

$(document).ready(function() {
  Initializers.init();
  stretchDisplay();
  $('span').click(function() {
    ga('send', 'event', { eventCategory: 'invites', eventAction: 'add to calendar'});
  });
});


$(window).load(function() {
  stretchDisplay();
});

$(window).resize(function() {
  stretchDisplay();
});
