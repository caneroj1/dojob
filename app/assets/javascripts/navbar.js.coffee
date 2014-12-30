navbar_form = ->
  $('#nav-login-link').mouseover ->
    $('.nav-login-here').fadeOut(300, ->
      $('.nav-form-hidden').fadeIn(300))

reverse_form = ->
  if $('nav-form-hidden').css("display") != "none"
    $('nav').mouseleave ->
      $('.nav-form-hidden').fadeOut(300, ->
        $('.nav-login-here').fadeIn(300))

nav_tooltips = ->
  $('[data-toggle="tooltip"]').tooltip()

$ ->
  do navbar_form
  do reverse_form
  do nav_tooltips
