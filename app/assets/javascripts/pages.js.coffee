$(document).ready ->
  if $('body').data('controller') == 'pages' && $('body').data('static-page') == 'home'
    maximize_slideshow()
    startCarousel()
    captionOverride()

startCarousel = ->
  $('#home-carousel').carousel({
    interval: 4500,
    pause: "false"
    })
    
  $('#playButton').click ->
    $('#home-carousel').carousel('cycle')
    
  $('#pauseButton').click ->
    $('#home-carousel').carousel('pause')
    
    
captionOverride = ->
  $('.carousel-caption').css('position',"relative")
  $('.carousel-caption').css('left',"0")
  $('.carousel-caption').css('right',"0")
  $('.carousel-caption').addClass('text-center')
  
maximize_slideshow = ->
 # available width is window width minus the nav_menu width
 # available height is window height
 # aspect ratio is 2x3
 
 h = $(window).height() - 80
 w = $(window).width()
 
 image_height = h
 image_width = h * 1.5
 
 if image_width >( w - $("#sidebar-wrapper").width())
   image_width =  w - $("#sidebar-wrapper").width()
   image_height = image_width * 2 / 3
   
 #$(".maximize_size").height(image_height)
 #$(".maximize_size").width(image_width)
 
 $("#home-carousel").height(image_height)
 $("#home-carousel").width(image_width)
 
 #$("img", "#home-carousel").height(image_height)
 #$("img", "#home-carousel").width(image_width)
 
 #alert image_height
 
 #$(".maximize_size").height(image_height)
 #$(".maximize_size").width(image_width)
 
 # Center the slideshow
 # figure out left margin
 left_margin = ($("#page-content-wrapper").width() - image_width)/2 - 20
 $("#carousel-wrapper").css("margin-left", left_margin)
 
 # resize container as well for centered text
 $('.item').width(image_width)
 
 #center the play/pause buttons
 $('#carouselButtons').css('margin-left', (image_width/2 -30))


