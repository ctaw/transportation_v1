$(document).on 'ready page:load', ->
  new WOW().init()


  $("#sign-up-btn").click ->
    $('.signin-header').addClass("hidden")
    $('.signup-header').removeClass("hidden")

  $("#sign-in-btn").click ->
    $('.signup-header').addClass("hidden")
    $('.signin-header').removeClass("hidden")

  $(window).resize(->
	  h = $(window).height()
	  offsetTop = 60

	  $('#map').css 'height', h - offsetTop
	  return
	).resize()


  $('#search_start').autocomplete
    source: $('#search_start').data('autocomplete-source')

  $('#search_destination').autocomplete
    source: $('#search_destination').data('autocomplete-source')
