//= require jquery
//= require jquery_ujs
//= require initializers
//= require slick.min

var stretchDisplay = function() {
  // starch background -  20 for display padding-bottom, 25 for footer height
  $('.display').css('min-height', $(window).height() - 20 - 25);
};

var verticalAlign = function() {
  $('.vertical-js').each(function(index) {
    var verticalObj = $(this);

    if ($(window).width() < 480) {
      var styles = {
        position: 'relative',
        top:      'auto',
        left:     'auto'
      }
    }
    else {
      var topVal  = ($(window).height() - verticalObj.height()) / 2;
      var leftVal = (verticalObj.parent().width() - verticalObj.width()) / 2;
      var styles  = {
        position: 'absolute',
        top:      topVal + 'px',
        left:     leftVal + 'px'
      }
    }

    verticalObj.css(styles);
  });
};

$(document).ready(function() {
  Initializers.init();
  stretchDisplay();
  verticalAlign();
  $('span').click(function() {
    ga('send', 'event', { eventCategory: 'invites', eventAction: 'add to calendar'});
  });
});

$(window).load(function() {
  stretchDisplay();
  verticalAlign();
});

$(window).resize(function() {
  stretchDisplay();
  verticalAlign();
  verticalAlign(); // call it twice because with is not always updated at the first time.. :(
});
