# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$('#new-poem').on 'click', (event) ->
	event.preventDefault()
	$('#new-poem-form').toggle()