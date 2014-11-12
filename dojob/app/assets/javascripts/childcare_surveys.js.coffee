# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

slider_func = ->
  $('#slider-range').slider({
    range: true,
    min: 1,
    max: 18,
    values: [4, 14],
    slide: (event, ui) ->
      $("#amount").val($('#slider-range').slider("values", 0) + " - " + $('#slider-range').slider('values', 1) + ' years old')
    })

$ ->
  do slider_func
