
advance_form = ->
  $('#advance').on 'click', ->
    $('#formlabel').fadeOut(300, ->
      $('#formlabel').text('Personal Information')
      $('#formlabel').fadeIn(300))
    $('#stage1').fadeOut(300, ->
      $('#stage2').fadeIn(300))
    $('#progress').attr('src', '/assets/sign_up_right_number.png')
    false

rewind_form = ->
  $('#rewind').on 'click', ->
    $('#formlabel').fadeOut(300, ->
      $('#formlabel').text('Account Information')
      $('#formlabel').fadeIn(300))
    $('#stage2').fadeOut(300, ->
      $('#stage1').fadeIn(300))
    $('#progress').attr('src', '/assets/sign_up_left_number.png')
    false

$ ->
  do advance_form
  do rewind_form
