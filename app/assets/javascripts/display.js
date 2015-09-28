//= require jquery
//= require jquery_ujs
//= require initializers
//= require slick.min

$(document).ready(function() {
  Initializers.init();
  $('span').click(function() {
    ga('send', 'event', { eventCategory: 'invites', eventAction: 'add to calendar'});
  });
});

var stretchDisplay = function() {
  // starch background -  20 for display padding-bottom, 25 for footer height
  $('.display').css('min-height', $(window).height() - 20 - 25);
};

$(window).load(function() {
  stretchDisplay();
});

$(window).resize(function() {
  stretchDisplay();
});
