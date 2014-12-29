# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

check_skills = ->
  if !$('#plumbing').prop('checked')
    $('#plumbing-select').attr('disabled', 'disabled')
  $('#plumbing').change ->
    if $('#plumbing').prop('checked')
      $('#plumbing-select').removeAttr('disabled')
    else
      $('#plumbing-select').attr('disabled', 'disabled')

  if !$('#electrical').prop('checked')
    $('#electrical-select').attr('disabled', 'disabled')
  $('#electrical').change ->
    if $('#electrical').prop('checked')
      $('#electrical-select').removeAttr('disabled')
    else
      $('#electrical-select').attr('disabled', 'disabled')

  if !$('#carpentry').prop('checked')
    $('#carpentry-select').attr('disabled', 'disabled')
  $('#carpentry').change ->
    if $('#carpentry').prop('checked')
      $('#carpentry-select').removeAttr('disabled')
    else
      $('#carpentry-select').attr('disabled', 'disabled')

  if !$('#automotive').prop('checked')
    $('#automotive-select').attr('disabled', 'disabled')
  $('#automotive').change ->
    if $('#automotive').prop('checked')
      $('#automotive-select').removeAttr('disabled')
    else
      $('#automotive-select').attr('disabled', 'disabled')

  if !$('#hvac').prop('checked')
    $('#hvac-select').attr('disabled', 'disabled')
  $('#hvac').change ->
    if $('#hvac').prop('checked')
      $('#hvac-select').removeAttr('disabled')
    else
      $('#hvac-select').attr('disabled', 'disabled')

check_form = ->
  $('#hs_form').submit ->
    $('.lab').removeClass('text-danger')
    submit = true
    
    if ( !$('#plumbing').prop('checked') && !$('#carpentry').prop('checked') && !$('#electrical').prop('checked') && !$('#automotive').prop('checked') && !$('#hvac').prop('checked') )
      $('#header-error').css('display', 'block')
      $('#skill-label').addClass('text-danger')
      submit = false

    if $('#handy-text').val() == ''
      $('#header-error').css('display', 'block')
      $('#text-label').addClass('text-danger')
      submit = false

    return submit

$ ->
  do check_skills
  do check_form
