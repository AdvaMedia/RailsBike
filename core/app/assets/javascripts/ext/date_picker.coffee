$(document).ready -> 
	I18nLocale = 'en'
	$.datepicker.setDefaults($.datepicker.regional[I18nLocale])
	$('input[type=text].date').datepicker($.datepicker.regional[I18nLocale])