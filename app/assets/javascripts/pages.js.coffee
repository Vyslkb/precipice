$(document).ready ->
  if $('body').data('controller') == 'pages' && $('body').data('static-page') == 'home'
    maximize_slideshow()
    startCarousel()
    captionOverride()
    
    $(window).resize ->
      maximize_slideshow()

startCarousel = ->
  $('#home-carousel').carousel({
    interval: 4500,
    pause: "false"
    })
    
  $('#playButton').hide()
    
  $('#playButton').click ->
    $('#home-carousel').carousel('next')
    $('#home-carousel').carousel('cycle')
    $(this).hide()
    $('#pauseButton').show()
    
  $('#pauseButton').click ->
    $('#home-carousel').carousel('pause')
    $(this).hide()
    $('#playButton').show()  
    
captionOverride = ->
  $('.carousel-caption').css('position',"relative")
  $('.carousel-caption').css('left',"0")
  $('.carousel-caption').css('right',"0")
  $('.carousel-caption').addClass('text-center')
  
maximize_slideshow = ->
 # available width is window width minus the nav_menu width
 # available height is window height, minus room for the title and shopping cart link
 # aspect ratio is 2x3
 
 #Figure out height of other elements
 h = $(window).height() - 95 - $('#top_links_container').height()
 w = $(window).width()
 
 image_height = h
 image_width = h * 1.5
 
 if image_width > $("#main").width()
   image_width =  $("#main").width()
   image_height = image_width * 2 / 3
  
 $("#home-carousel").height(image_height)
 $("#home-carousel").width(image_width)
 
 # Center the slideshow
 # figure out left margin

 #!!!!!!!!!!!!!!!!!!!!!!!
 left_margin = ($("#main").width() - image_width)/2 - 20
 $("#carousel-wrapper").css("margin-left", left_margin)
 
 # resize container as well for centered text
 $('.item').width(image_width)
 
 #center the play/pause buttons
 $('#carouselButtons').css('margin-left', (image_width/2 -16))

