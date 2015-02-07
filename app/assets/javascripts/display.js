//= require jquery
//= require jquery_ujs
//= require foundation_slim
$(document).foundation();
var resizeFun = function() {
  var bodyHeight = $('body').height();
  console.log('body: ' + bodyHeight);
  if (bodyHeight <= 677 && bodyHeight >= 450) {
    var imgHeight = $('img.main').height();
    console.log('image: ' + imgHeight);
    var marginTop = ((bodyHeight - imgHeight) / 2) - bodyHeight * 5 / 100;
    console.log('margin-top: ' + marginTop);
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

