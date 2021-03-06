# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

forms = 2
check_certs = true
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

prep_desc = ->
  if $('#misc').length
    if $('#misc').val().length > 0
      if($('#misc').val().length >= 30)
        $('#char-count').css('color', '#00cd25')
      else
        $('#char-count').css('color', '#d9534f')
      $('#char-count').text($('#misc').val().length + "/" + "300 characters")

change_color = ->
  $('#misc').on 'input',  ->
    if($('#misc').val().length >= 30)
      $('#char-count').css('color', '#00cd25')
    else
      $('#char-count').css('color', '#d9534f')
    $('#char-count').text($('#misc').val().length + "/" + "300 characters")


convert_dates = (num_forms) ->
  while(num_forms > 0)
    date_arr = $('#cert_exp_' + num_forms).val().split("/")
    date = new Date(date_arr[2], date_arr[0] - 1, date_arr[1])
    $('#cert_exp_' + num_forms).val(date.toUTCString())
    num_forms -= 1

prep_date_picker = ->
  $('#cert_exp_1').datepicker({minDate: '-0d', defaultDate: +0} )

slider_func = ->
  $('#slider-range').slider({
    range: true,
    min: 1,
    max: 18,
    values: [$('#ar1').text(), $('#ar2').text()],
    slide: (event, ui) ->
      $("#amount").val(ui.values[0] + " - " + ui.values[1] + " years old")
    })
  $("#amount").val($('#slider-range').slider("values", 0) + " - " + $('#slider-range').slider('values', 1) + ' years old')

add_certs_func = ->
  $('#add-certs').on 'click', ->
    if forms <= 3
      $('#add-above').before(
        '<div class="col-sm-12 text-center add-margin"><h5 class= "lab" id="cert-' + forms + '">Certification #' + forms + '</h5></div>' +
        '<div class="col-sm-8"><label class="control-label">Title</label><input class="form-control" name="cert_title_' + forms + '" id="cert_title_' + forms + '" type="text"></div>' +
        '<div class="col-sm-4"><label class="control-label">Expires</label><input class="form-control" name="cert_exp_' + forms + '" id="cert_exp_' + forms + '" type="datetime" readonly></div>'
      )
      $('#cert_exp_'+forms).datepicker({minDate: '-0d', defaultDate: +0} )
      forms += 1

check_form_func = ->
  $('#ccs_form').submit ->
    submit = true

    $('.lab').removeClass('text-danger')

    if(!$('#experience_under_1_year').prop('checked') && !$('#experience_1_-_2_years').prop('checked') && !$('#experience_3_-_4_years').prop('checked') && !$('#experience_5__years').prop('checked'))
      $('#exp-label').addClass('text-danger')
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
      do convert_dates(forms - 1)

$(document).ready ->
  do existing_certs
  do show_certs
  do hide_certs
  do prep_desc
  do prep_date_picker
  do check_form_func
  do slider_func
  do add_certs_func
  do change_color
