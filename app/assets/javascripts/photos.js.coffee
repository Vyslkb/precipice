# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$(document).ready ->
  if $('body').data('controller') == 'photos' 
    if $('body').data('action') == 'manage_slideshow'
      sortItems()




sortItems = ->
  $("<style type='text/css'> .sortable-placeholder{ background-color: #000; width: 175px; height: 110px;} </style>").appendTo("head");
  #$('ul.sortable').sortable()
  $('ul.sortable').sortable().on('sortupdate', -> sortResponse())
  renumberSortableItems()
renumberSortableItems = ->
  $('li', 'ul.sortable').each (index, element) =>
    $('*[data-content="sort_order_field"]', element).val(index)

sortResponse = ->
  renumberSortableItems()
  


