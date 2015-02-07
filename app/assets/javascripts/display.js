//= require jquery
//= require jquery_ujs
//= require foundation_slim
$(document).foundation();
var resizeFun = function() {
  var docHeight = $('body').height();
  console.log(docHeight);
  if (docHeight <= 677 && docHeight >= 480) {
    var imgHeight = $('img.main').height();
    console.log(imgHeight);
    var marginTop = (docHeight - imgHeight) / 2;
    console.log(marginTop);
    $('.theme-wrapper').css('margin-top', marginTop + 'px');
  } else {
    $('.theme-wrapper').css('margin-top', 0);
  }
};

$(document).ready(function() {
  $('span').click(function() {
    ga('send', 'event', { eventCategory: 'invites', eventAction: 'add to calendar'});
  });

  $(window).resize(resizeFun);
});

$(window).load(function() {
  resizeFun();
});

