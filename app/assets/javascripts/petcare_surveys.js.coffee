# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

check_certs = true
forms = 2

existing_certs = ->
  if $('#exist').text() != "false"
    check_certs = false
    $('#certs').css('display', 'none')

show_certs = ->
  $('#cert-btn').on 'click', ->
    $('#certs').fadeIn(400)
    $('#cert-btn').fadeOut(400)
    check_certs = true

hide_certs = ->
  $('#cert-close').on 'click', ->
    $('#certs').fadeOut(400)
    $('#cert-btn').fadeIn(400)
    check_certs = false

pets_array = ->
  pets_str = ""
  if $('#dogs').prop('checked')
    pets_str += "Dogs,"
  if $('#cats').prop('checked')
    pets_str += "Cats,"
  if $('#fish').prop('checked')
    pets_str += "Fish,"
  if $('#reptiles').prop('checked')
    pets_str += "Reptiles,"
  if $('#birds').prop('checked')
    pets_str += "Birds,"
  if $('#mams').prop('checked')
    pets_str += "Small Mammals,"
  if $('#exo').prop('checked')
    pets_str += "Exotic/Other,"
  $('#pets-hidden').val(pets_str)

dates_func = ->
  num_forms = forms - 1
  while(num_forms > 0)
    date_arr = $('#cert_exp_' + num_forms).val().split("/")
    date = new Date(date_arr[2], date_arr[0] - 1, date_arr[1])
    $('#cert_exp_' + num_forms).val(date.toUTCString())
    num_forms -= 1

check_form_func = ->
  $('#pcs_form').submit ->
    submit = true
    $('.lab').removeClass('text-danger')

    if(!$('#experience_under_1_year').prop('checked') && !$('#experience_1_-_2_years').prop('checked') && !$('#experience_3_-_4_years').prop('checked') && !$('#experience_5__years').prop('checked'))
      $('#exp-label').addClass('text-danger')
      submit = false

    if(!$('#dogs').prop('checked') && !$('#cats').prop('checked') && !$('#fish').prop('checked') && !$('#reptiles').prop('checked') && !$('#birds').prop('checked') && !$('#mams').prop('checked') && !$('#exo').prop('checked'))
      $('#pet-label').addClass('text-danger')
      submit = false

    if($('#misc').val().length < 30 || $('#misc').val() == '')
      $('#misc-label').addClass('text-danger')
      submit = false

    if check_certs
      dummy = forms - 1
      while(dummy > 0)
        if($('#cert_title_'+dummy).val() == '' || $('#cert_exp_'+dummy).val() == '')
          $('#cert-' + dummy).addClass('text-danger')
          submit = false
        dummy -= 1
    if check_certs
      $('#num_certs').val(forms - 1)
    else
      $('#num_certs').val("no")

    if(submit == false)
      $('html, body').animate({scrollTop : 0},800);
      $('#header-error').fadeIn(900)
      return false
    if check_certs
      do dates_func
    do pets_array

$ ->
  do check_form_func
  do existing_certs
  do show_certs
  do hide_certs
