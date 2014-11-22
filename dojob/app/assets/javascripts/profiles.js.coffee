# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

toggle_availability = ->
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
