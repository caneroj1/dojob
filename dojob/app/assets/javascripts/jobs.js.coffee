# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

char_count_func = ->
  $('#offer-body').on 'input', ->
    len = $.trim($('#offer-body').val()).length
    if len > 0
      $('#char-count').css('color', '#00cd25')
    else
      $('#char-count').css('color', '#d9534f')
    $('#char-count').text(len + "/1000")

on_form_submit = ->
  $('#offer-form').submit ->
    if $.trim($('#offer-body').val()).length < 1
      return false
    $('#offerModal').modal('hide')

init_edit_form = ->
  $('#char-count').text($('#job-description').val().length + "/500")
  $('#char-count').css('color', '#00cd25')
  if $('#job_frequency_one_time').prop('checked')
    $('#datepicker').prop('disabled', false).css('background-color', 'white')

$ ->
  do char_count_func
  do on_form_submit
  do init_edit_form
