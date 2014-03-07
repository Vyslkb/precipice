$(document).ready( function(){
	
	$('#blueimp-gallery').on('slide', function (event, index, slide) {
        var this_link = $("a:eq( " + index + "  )",  $('#blueimp-links'));
        
        var d_text = this_link.attr("data-description");
        
        
        
      $(".description", $(this)).text(d_text);
      
      
      /***  
        var text = this.list[index].getAttribute('data-description'),
	   #             node = this.container.find('.description');
	   #         node.empty();
	   #         if (text) {
	   #             node[0].appendChild(document.createTextNode(text));
	   #         }

	
	
	***/
   });

});