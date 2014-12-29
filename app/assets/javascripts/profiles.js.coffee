# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

avatar_upload_check = ->
  $('#avatar-file').change ->
    if $('#avatar-file').val() != ''
      $('#avatar-submit').removeAttr('disabled')
      $('#upload-name').text($('#avatar-file').val().replace("C:\\fakepath\\", ""))

avatar_form_submit = ->
  $('#avatar-form').on 'submit', ->
    files_regex = /(\.|\/)(jpe?g|png)$/i
    filename = $('#avatar-file').val().replace("C:\\fakepath\\", "")
    if files_regex.test(filename)
      return true
    else
      $('#errors').css('display', 'block')
      return false

reference_form_check = ->
    $('#new-ref-form').on 'submit', ->
      emailRegex = /\b([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})/i
      numberRegex = /\b[0-9]{10}/
      if $('#email-field').val() == '' && $('#phone-field').val() == ''
        return false
      else if $('#email-field').val() != '' && $('#phone-field').val() == ''
        if !emailRegex.test($('#email-field').val())
          $('#email-label').css('color', '#d9534f')
          return false
      else if $('#email-field').val() == '' && $('#phone-field').val() != ''
        if !numberRegex.test($('#phone-field').val())
          $('#phone-label').css('color', '#d9534f')
          return false
      else
        if !emailRegex.test($('#email-field').val()) && !numberRegex.test($('#phone-field').val())
          $('#phone-label').css('color', '#d9534f')
          $('#email-label').css('color', '#d9534f')
          return false
      return true

convert_time = (time) ->
  if(time == -4)
    return "8 am"
  else if(time == -3)
    return "9 am"
  else if(time == -2)
    return "10 am"
  else if(time == -1)
    return "11 am"
  else if(time ==  0)
    return "12 pm"
  else return (time + " pm")

hours_slider_func = ->
  $('#slider-hours').slider {
    range: true,
    min: -4,
    max: 9,
    values: [0, 6],
    slide: (event, ui) ->
      $('#hours-lab').text("Hours: " + convert_time(ui.values[0]) + " - " + convert_time(ui.values[1]))
      $('#hours-inp').val(ui.values[0] + "," + ui.values[1])
  }
  $('#hours-lab').text("Hours: " + convert_time($('#slider-hours').slider("values", 0)) + " - " + convert_time($('#slider-hours').slider("values", 1)))
  $('#hours-inp').val($('#slider-hours').slider("values", 0) + "," + $('#slider-hours').slider("values", 1))

toggle_availability = ->
  $('.slot').addClass('can-click')
  $('.slot').on 'click', ->
    data = ""
    name = ""
    id = $('#uav').data('d')
    $(this).toggleClass('unavailable')

    if $(this).hasClass('unavailable')
      data = "0"
    else
      data = "1"

    name = $(this).attr('id')

    $.ajax {
      type: "POST",
      url: "/profiles/" + id + "/mark_availability",
      data: { name: name, available: data }
    }

$ ->
  if ($('#avail').data('page') == 'edit')
    $('#avatar-file').bootstrapFileInput();
    $('[data-toggle="tooltip"]').tooltip()
    jQuery(".best_in_place").best_in_place();
    do toggle_availability
    do reference_form_check
  do hours_slider_func
  do avatar_upload_check
  do avatar_form_submit
  # do display_avatar_upload
