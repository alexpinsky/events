//= require jquery
//= require jquery_ujs
//= require foundation_slim
//= require initializers

var resizeFn = function() {
  var bodyHeight = $('body').height();
  console.log('body: ' + bodyHeight);
  if (bodyHeight <= 966 && bodyHeight >= 350) {
    var imgHeight = $('.images-container').height();
    console.log('image: ' + imgHeight);
    var marginTop = ((bodyHeight - imgHeight) / 2) - bodyHeight * 5 / 100;
    console.log('margin-top: ' + marginTop);
    if (marginTop < 0) {
      marginTop = 0;
    };
    $('.theme-wrapper').css('margin-top', marginTop + 'px');
  } else {
    $('.theme-wrapper').css('margin-top', 0);
  }
};

$(document).foundation();

$(document).ready(function() {
  Initializers.init();
  $(window).resize(function () {
    setTimeout(function() {
      resizeFn();
    }, 100);
  });
  $('span').click(function() {
    ga('send', 'event', { eventCategory: 'invites', eventAction: 'add to calendar'});
  });
});

$(window).load(function() {
  resizeFn();
});

