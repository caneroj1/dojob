# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

stats_jobs_click = ->
  checkExist1 = setInterval(->
    if $("#acceptj10").length
      $('#acceptj10').on 'click', ->
        $('#replace-radar-chart').load("/users/" + $('#uid').text() + "/calculate_accepted_jobs?time=10days")
      $('#acceptj30').on 'click', ->
        $('#replace-radar-chart').load("/users/" + $('#uid').text() + "/calculate_accepted_jobs?time=30days")
      $('#acceptja').on 'click', ->
        $('#replace-radar-chart').load("/users/" + $('#uid').text() + "/calculate_accepted_jobs?time=all")
      clearInterval checkExist1
    return
  , 100) # check every 100ms

  checkExist2 = setInterval(->
    if $("#completej10").length
      $('#completej10').on 'click', ->
        $('#replace-complete-chart').load("/users/" + $('#uid').text() + "/calculate_completed_jobs?time=10days")
      $('#completej30').on 'click', ->
        $('#replace-complete-chart').load("/users/" + $('#uid').text() + "/calculate_completed_jobs?time=30days")
      $('#completeja').on 'click', ->
        $('#replace-complete-chart').load("/users/" + $('#uid').text() + "/calculate_completed_jobs?time=all")
      clearInterval checkExist2
    return
  , 100) # check every 100ms

calc_accepted_jobs = ->
  $('#replace-radar-chart').load("/users/" + $('#uid').text() + "/calculate_accepted_jobs?time=10days")

calc_completed_jobs = ->
  $('#replace-complete-chart').load("/users/" + $('#uid').text() + "/calculate_completed_jobs?time=10days")

get_accepted_jobs = ->
  $("#replace-accepted-jobs").load("/users/" + $('#uid').text() + "/accepted_jobs")

get_completed_jobs = ->
  $('#replace-completed-jobs').load("/users/" + $('#uid').text() + "/completed_jobs")

get_contacts = ->
  $('#replace-contacts').load("/users/" + $('#uid').text() + "/contacts")

change_count_color = ->
  $('#char-count').css('color', '#d9534f')
  $('#job-description').on 'input',  ->
    if($('#job-description').val().length >= 30)
      $('#char-count').css('color', '#00cd25')
    else
      $('#char-count').css('color', '#d9534f')
    $('#char-count').text($('#job-description').val().length + "/" + "500")

upgrade_form = ->
  $('#upgrade_form').on 'submit', ->
    $('#check_it_off').prop('checked', true)
    return true

display_deadline = ->
  $('#job_frequency_one_time').change ->
    if($('#job_frequency_one_time').prop('checked'))
      $('#datepicker').prop('disabled', false)
      $('#datepicker').css('background-color', 'white')
      d = new Date()
      $('#datepicker').val((d.getMonth() + 1) + "/" + d.getDate() + "/" + d.getFullYear())

hide_deadline = ->
  $('#job_frequency_weekly').change ->
    if($('#job_frequency_weekly').prop('checked'))
      if($('deadline').css('display') != 'none')
        $('#datepicker').prop('disabled', true)
        $('#datepicker').css('background-color', '#eeeeee')

  $('#job_frequency_as_needed').change ->
    if($('#job_frequency_as_needed').prop('checked'))
      if($('deadline').css('display') != 'none')
        $('#datepicker').prop('disabled', true)
        $('#datepicker').css('background-color', '#eeeeee')


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
    if(($('#job-description').val() == "") || $('#job-description').val().length < 30)
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
  do get_accepted_jobs # ajax request for accepted jobs
  do get_completed_jobs # ajax request for completed jobs
  do get_contacts
  
  # ajax requests for statistics
  do calc_accepted_jobs
  do calc_completed_jobs

  do upgrade_form
  do display_deadline
  do hide_deadline
  do datepicker_for_posting
  do prepare_posting_for_submit
  do change_count_color
  do stats_jobs_click
