# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
jQuery ->
	$('#landing_page_industry_name').autocomplete
		source: $('#landing_page_industry_name').data('ac-source')
	$('#landing_page_landing_page_type_name').autocomplete
		source: $('#landing_page_landing_page_type_name').data('autocomplete-source')
	$('#landing_page_release_date').datepicker({
		dateFormat: 'yy-mm-dd'
	});