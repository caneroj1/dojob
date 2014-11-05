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
      $('#datepicker').prop('disabled', false)

hide_deadline = ->
  $('#job_frequency_weekly').change ->
    if($('#job_frequency_weekly').prop('checked'))
      if($('deadline').css('display') != 'none')
        $('#datepicker').prop('disabled', true)
  $('#job_frequency_as_needed').change ->
    if($('#job_frequency_as_needed').prop('checked'))
      if($('deadline').css('display') != 'none')
        $('#deadline').prop('disabled', true)

datepicker_for_posting = ->
  $('#datepicker').datepicker({minDate: '-0d'})

prepare_posting_for_submit = ->
  $('#post-job').on 'submit', ->
    if($('#datepicker').val() != '')
      date_arr = $('#datepicker').val().split("/")
      date = new Date(date_arr[0], date_arr[1], date_arr[2])
      $('#datepicker').val(date.toUTCString())

$ ->
  do upgrade_form
  do display_deadline
  do hide_deadline
  do datepicker_for_posting
  do prepare_posting_for_submit
