//= require jquery
//= require jquery_ujs
//= require ./old/initializers
//= require slick.min

var stretchDisplay = function() {
  var windowHeight = $(window).height();
  var docHeight    = $(document).height();
  var extractSize  = 45; // 20 for display padding-bottom, 25 for footer height

  var minHeight = Math.max(windowHeight, docHeight);

  $('.display').css('min-height', docHeight - extractSize);
};

var restretchDisplay = function() {
  $('.display').css('min-height', '');
}

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
        top: topVal + 'px',
        left: leftVal + 'px'
      }
    }

    verticalObj.css(styles);
  });
};

var removeOverlay = function() {
  $('.overlay').remove();
};

$(document).ready(function() {
  Initializers.init();
  verticalAlign();
  stretchDisplay();
  removeOverlay();
});

$(window).load(function() {
  verticalAlign();
  stretchDisplay();
});

$(window).resize(function() {
  restretchDisplay();
  verticalAlign();
  stretchDisplay();
});
