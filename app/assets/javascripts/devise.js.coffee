
advance_form = ->
  $('#advance').on 'click', ->
    $('#formlabel').fadeOut(300, ->
      $('#formlabel').text('Personal Information')
      $('#formlabel').fadeIn(300))
    $('#stage1').fadeOut(300, ->
      $('#stage2').fadeIn(300))
    $('#circle-right').removeClass('unfilled')
    $('#circle-left').addClass('unfilled')
    false

rewind_form = ->
  $('#rewind').on 'click', ->
    $('#formlabel').fadeOut(300, ->
      $('#formlabel').text('Account Information')
      $('#formlabel').fadeIn(300))
    $('#stage2').fadeOut(300, ->
      $('#stage1').fadeIn(300))
    $('#circle-right').addClass('unfilled')
    $('#circle-left').removeClass('unfilled')
    false

$ ->
  do advance_form
  do rewind_form
