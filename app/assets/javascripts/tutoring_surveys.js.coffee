# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

compile_science = ->
  sci_arr = ""
  if $('#bio').prop('checked')
    sci_arr += "Biology,"
  if $('#chem').prop('checked')
    sci_arr += "Chemistry,"
  if $('#phys').prop('checked')
    sci_arr += "Physics,"
  if $('#prog').prop('checked')
    sci_arr += "Computer Science,"
  $('#sci_hidden').val(sci_arr)

compile_math = ->
  math_arr = ""
  if $('#alg').prop('checked')
    math_arr += "Algebra,"
  if $('#geo').prop('checked')
    math_arr += "Geometry,"
  if $('#trig').prop('checked')
    math_arr += "Trigonometry,"
  if $('#precalc').prop('checked')
    math_arr += "Precalculus,"
  if $('#calc').prop('checked')
    math_arr += "Calculus,"
  $('#math_hidden').val(math_arr)

compile_languages = ->
  lang_arr = ""
  if $('#span').prop('checked')
    lang_arr += "Spanish,"
  if $('#fre').prop('checked')
    lang_arr += "French,"
  if $('#chi').prop('checked')
    lang_arr += "Chinese,"
  if $('#ger').prop('checked')
    lang_arr += "German,"
  if $('#ita').prop('checked')
    lang_arr += "Ialian,"
  if $('#lat').prop('checked')
    lang_arr += "Latin,"
  $('#lang_hidden').val(lang_arr)

compile_music = ->
  mus_arr = ""
  if $('#pia').prop('checked')
    mus_arr += "Piano,"
  if $('#gui').prop('checked')
    mus_arr += "Guitar,"
  if $('#wood').prop('checked')
    mus_arr += "Woodwinds,"
  if $('#bra').prop('checked')
    mus_arr += "Brass,"
  if $('#perc').prop('checked')
    mus_arr += "Percussion,"
  $('#mus_hidden').val(mus_arr)

check_form_submit = ->
  $('#ts_form').submit ->
    submit = true
    $('.lab').removeClass('text-danger')

    if(!$('#experience_under_1_year').prop('checked') && !$('#experience_1_-_2_years').prop('checked') && !$('#experience_3_-_4_years').prop('checked') && !$('#experience_5__years').prop('checked'))
      $('#exp-label').addClass('text-danger')
      submit = false

    if(!$('#education_Elementary__1-4_').prop('checked') &&
       !$('#education_Middle_School__5-8_').prop('checked') &&
       !$('#education_High_School__9-12_').prop('checked') &&
       !$('#education_College').prop('checked'))
      $('#edu-label').addClass('text-danger')
      submit = false

    at_least_one_checked = false
    $('.checkbox-inline').each ->
      cb = $(this).find('input')
      at_least_one_checked |= cb.prop('checked')

    if !at_least_one_checked
      $('#sub-label').addClass('text-danger')
      submit = false

    if(submit == false)
      $('html, body').animate({scrollTop : 0},800);
      $('#header-error-tutor').fadeIn(900)
      return false

    do compile_languages
    do compile_science
    do compile_math
    do compile_music

$ ->
  do check_form_submit
