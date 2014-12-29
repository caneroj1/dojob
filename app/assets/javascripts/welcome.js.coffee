# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

job_arr = [ 'petcare', 'tutoring', 'shopping', 'construction', 'babysitting', 'gardening', 'housework']
change_words = ->
  arr_size = job_arr.length
  counter = 0

  $.repeat 4000, () ->
    $('#dj-change').fadeOut(1500, ->
      $('#dj-change').text(job_arr[counter])
      $('#dj-change').fadeIn(1500, ->
        counter = (counter + 1) % arr_size))

$ ->
    do change_words
