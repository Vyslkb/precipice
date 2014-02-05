
$(document).ready ->
  spinner_position() 
  ajax_spinner() 
  background_image()

ajax_spinner = ->
   $("#spinner").hide()
   $(document).ajaxStart(->
    $("#spinner").show()
   )
   $(document).ajaxStop(->
    $("#spinner").hide()
   )
  
spinner_position = ->   
  spinner_pos = $(document).scrollTop() + ($(window).innerHeight() / 2 - 32)
  $("#spinner").css("top", spinner_pos)

#resize_nav_menu = ->
# $("#navigation_menu").height($(window).height())

#equalize_grid_height = ->
#  thumbnails = $('.equal_height')
#  heights = thumbnails.map( -> $(this).height()).get()
#  maxHeight = Math.max.apply(null, heights)
#  thumbnails.height(maxHeight)

background_image = ->
  $("img", "#background_image_container").width($(window).width()- $("#sidebar-wrapper").width())
  $("img", "#background_image_container").height($(window).height())
  $("img", "#background_image_container").css("margin-left", $("#sidebar-wrapper").width() )

@shrink_thumbnails = ->
  ##  Assume med size thumbnails: 308px
  ##  Assume 3 thumbnails per row
  $('[data-content="thumbnail-row"]').each ->
    if $(this).width() < 308 * 3
      #figure out new width
      new_width = ($(this).width() - 90)/3 
      $("img", $(this)).width(new_width)
      
    
      


