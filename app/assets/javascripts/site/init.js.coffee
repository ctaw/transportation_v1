$(document).on 'ready page:load', ->
  new WOW().init()


  $("#sign-up-btn").click ->
    $('.signin-header').addClass("hidden")
    $('.signup-header').removeClass("hidden")

  $("#sign-in-btn").click ->
    $('.signup-header').addClass("hidden")
    $('.signin-header').removeClass("hidden")

