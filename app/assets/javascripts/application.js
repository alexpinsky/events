// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//

// Libraries

//= require jquery
//= require jquery_ujs

// Application

//= require app
//= require dashboard
//= require templates
//= require editor
//= require pages
//= require state_handler
//= require react
//= require react_ujs
//= require components
//= require_tree ./shared
//= require_tree ./elements
//= require_tree ./state_handler
//= require_tree ./dashboard
//= require_tree ./editor

// External Plugins

//= require jquery.minicolors.min
//= require jquery.modal.min
//= require responsive-nav.min
//= require social-share-button
//= require file-validator
//= require jquery.timepicker.min
//= require jquery.datepair.min
//= require bootstrap-datepicker
//= require datepair.min
//= require ZeroClipboard.min
//= require jquery-editable-poshytip.min
//= require slick.min

$(document).ready(function() {
  App.start();
});