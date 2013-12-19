
$(document).ready ->
  foo() 
  ajax_spinner()

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

