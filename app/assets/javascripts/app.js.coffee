
$(document).ready ->
  foo() 
  ajax_spinner()
  resize_nav_menu()
  equalize_grid_height()
  maximize_slideshow()
  background_image()

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
  
maximize_slideshow = ->
 # available width is window width minus the nav_menu width
 # available height is window height
 # aspect ratio is 2x3
 
 h = $(window).height() - 40
 w = $(window).width()
 
 image_height = h
 image_width = h * 1.5
 
 if image_width >( w - $("#navigation_menu").width())
   image_width =  w - $("#navigation_menu").width()
   image_height = image_width * 2 / 3
   
 $(".maximize_size").height(image_height)
 $(".maximize_size").width(image_width)  
   
background_image = ->
  $("img", "#top_image").width($(window).width()- 200)

