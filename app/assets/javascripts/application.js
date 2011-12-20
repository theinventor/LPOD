// This is a manifest file that'll be compiled into including all the files listed below.
// Add new JavaScript/Coffee code in separate files in this directory and they'll automatically
// be included in the compiled file accessible from http://example.com/assets/application.js
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
//= require jquery
//= require jquery-ui
//= require jquery_ujs
//= require foundation 
//= require_tree .
//= require_self    

$(window).load(function() {
  $('.tag').each(function(i) {
  	setTimeout(function() {
  		$('.tag:eq('+i+')').css({ display: 'block', opacity: 0 }).stop().animate({ opacity: 1 }); 
  	}, 250 * (i + 1))
  });
	$('.tag').hover(function() {
		$(this).stop().animate({ paddingRight: ($('.tag_count', this).outerWidth() - 6) });
	}, function() {
		$(this).stop().animate({ paddingRight: 6 });
	});
});