$(document).ready ->
  if $('body').data('controller') == 'pages' && $('body').data('static-page') == 'home'
    maximize_slideshow()


maximize_slideshow = ->
 # available width is window width minus the nav_menu width
 # available height is window height
 # aspect ratio is 2x3
 
 h = $(window).height() - 50
 w = $(window).width()
 
 image_height = h
 image_width = h * 1.5
 
 if image_width >( w - $("#sidebar-wrapper").width())
   image_width =  w - $("#sidebar-wrapper").width()
   image_height = image_width * 2 / 3
   
 $(".maximize_size").height(image_height)
 $(".maximize_size").width(image_width)
 
 # Center the slideshow
 # figure out left margin
 left_margin = ($("#page-content-wrapper").width() - image_width)/2 - 20
 $("#carousel-wrapper").css("margin-left", left_margin)