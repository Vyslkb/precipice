
$(document).ready ->
  foo() 
  ajax_spinner()
  resize_nav_menu()

ajax_spinner = ->
   $("#spinner").hide()
   $(document).ajaxStart(->
    $("#spinner").show()
   )
   $(document).ajaxStop(->
    $("#spinner").hide()
   )
  
foo = ->   
  spinner_pos = $(document).scrollTop() + ($(window).innerHeight() / 2 - 32)
  $("#spinner").css("top", spinner_pos)

resize_nav_menu = ->
  $("#navigation_menu").height($(window).height())
