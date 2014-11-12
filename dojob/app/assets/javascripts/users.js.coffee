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
      d = new Date()
      $('#datepicker').val((d.getMonth() + 1) + "/" + d.getDate() + "/" + d.getFullYear())

hide_deadline = ->
  $('#job_frequency_weekly').change ->
    if($('#job_frequency_weekly').prop('checked'))
      if($('deadline').css('display') != 'none')
        $('#datepicker').prop('disabled', true)
  $('#job_frequency_as_needed').change ->
    if($('#job_frequency_as_needed').prop('checked'))
      if($('deadline').css('display') != 'none')
        $('#datepicker').prop('disabled', true)

datepicker_for_posting = ->
  $('#datepicker').datepicker({minDate: '-0d', defaultDate: +0} )

prepare_posting_for_submit = ->
  $('#post-job').on 'submit', ->
    submit = true
    # WHEN THE FORM IS SUBMITED, CLEAR ANY ERROR COLORS
    $('.inner-label').removeClass('text-danger')
    $('.tags-error').css('display', 'none')

    # CHECK IF THE REQUIRED FIELDS HAVE BEEN INPUT
    # if not, mark the ones as unfilled and change color
    if($('#job_title').val() == "")
      $('#title-label').addClass('text-danger')
      submit = false
    if( !$('#job_where_my_house').prop('checked') && !$('#job_where_remote').prop('checked') && !$('#job_where_errandother').prop('checked'))
      $('#location-label').addClass('text-danger')
      submit = false
    if( !$('#job_frequency_one_time').prop('checked') && !$('#job_frequency_weekly').prop('checked') && !$('#job_frequency_as_needed').prop('checked'))
      $('#frequency-label').addClass('text-danger')
      submit = false
    if($('#job-description').val() == "")
      $('#description-label').addClass('text-danger')
      submit = false

    at_least_one_checked = false
    tags_str = ""
    $(':checkbox').each ->
      at_least_one_checked |= $(this).prop('checked')
      if($(this).prop('checked'))
        tags_str += $(this).val() + "."
    if(at_least_one_checked)
      $('#job_tags').val(tags_str)
    else
      $('.tags-error').css('display', 'block')
      submit = false

    if(submit == false)
      $('html, body').animate({scrollTop : 0},800);
      $('#header-error').fadeIn(900)
      return false

    if($('#datepicker').val() != '')
      # split the date string
      date_arr = $('#datepicker').val().split("/")

      # date_arr[2] has the year
      # date_arr[0] contains the month. js starts january from 0
      # date_arr[1] has the day
      date = new Date(date_arr[2], date_arr[0] - 1, date_arr[1])
      $('#datepicker').val(date.toUTCString())

$ ->
  do upgrade_form
  do display_deadline
  do hide_deadline
  do datepicker_for_posting
  do prepare_posting_for_submit
