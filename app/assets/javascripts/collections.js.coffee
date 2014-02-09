# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$(document).ready ->
  if $('body').data('controller') == 'collections'
    shrink_thumbnails()
    
    if $('body').data('action') == 'edit'
      sortItems()
      
    if $('body').data('action') == 'edit_display_order'  
      sortItems()
      
sortItems = ->
  $("<style type='text/css'> .sortable-placeholder{ background-color: #000;height: 30px;} </style>").appendTo("head");
  $('ul.sortable').sortable().on('sortupdate', -> sortResponse())
  renumberSortableItems()
renumberSortableItems = ->
  $('li', 'ul.sortable').each (index, element) =>
    $('*[data-content="sort_order_field"]', element).val(index)

sortResponse = ->
  renumberSortableItems()
