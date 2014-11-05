# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

upgrade_form = ->
  $('#upgrade_form').on 'submit', ->
    $('#check_it_off').prop('checked', true)
    return true

display_deadline = ->
  $('#job_frequency_one_time').change ->
    if($('#job_frequency_one_time').prop('checked'))
      # $('#deadline').slideDown(500)
      $('#datepicker').prop('disabled', false)

hide_deadline = ->
  $('#job_frequency_weekly').change ->
    if($('#job_frequency_weekly').prop('checked'))
      if($('deadline').css('display') != 'none')
        # $('#deadline').slideUp(500)
        # $('#datepicker').text('')
        $('#datepicker').prop('disabled', true)


  $('#job_frequency_as_needed').change ->
    if($('#job_frequency_as_needed').prop('checked'))
      if($('deadline').css('display') != 'none')
        # $('#deadline').slideUp(500)
        # $('#datepicker').text('')
        $('#deadline').prop('disabled', true)

datepicker_for_posting = ->
  $('#datepicker').datepicker({minDate: '-0d'})

$ ->
  do upgrade_form
  do display_deadline
  do hide_deadline
  do datepicker_for_posting
