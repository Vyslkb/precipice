$(document).ready ->
  set_sidebar()
  
  $(window).resize ->
    set_sidebar()
    revert_sidebar()
  
set_sidebar = ->
    if $(window).height() < 550
      $('#main').removeClass("col-xs-offset-2")
      $('#sidebar').removeClass("fixed")
      #$('#bg-container').addClass("hidden")
        
        
        
revert_sidebar = ->
  if $(window).height() >= 550
    unless $('#main').hasClass("col-xs-offset-2")
      $('#main').addClass("col-xs-offset-2")
      $('#sidebar').addClass("fixed")
      #$('#bg-container').removeClass("hidden")
  
  
  #$('#show_menu').click ->
  #  $("#main").toggleClass("hidden")
   
    
   # $("#menu-lg").toggleClass("hidden-xs")
   # $("#menu-xs").toggleClass("hidden")
    
   # $("#sidebar").toggleClass("col-xs-2")
   # $("#sidebar").toggleClass("col-xs-4")
   # $("#sidebar").toggleClass("fixed")  