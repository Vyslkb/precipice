
$(document).ready ->
  foo() 
  ajax_spinner()
  resize_nav_menu()
  equalize_grid_height()

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

equalize_grid_height = ->
  thumbnails = $('.equal_height')
  heights = thumbnails.map( -> $(this).height()).get()
  maxHeight = Math.max.apply(null, heights)
  thumbnails.height(maxHeight)