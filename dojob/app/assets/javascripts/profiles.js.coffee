# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

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
    do toggle_availability
  do hours_slider_func
