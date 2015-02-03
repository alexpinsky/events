//= require jquery
//= require jquery_ujs
//= require foundation_slim
$(document).foundation();
$(document).ready(function() {
  $('span').click(function() {
    ga('send', 'event', { eventCategory: 'invites', eventAction: 'add to calendar'});
  });
});