# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).ready ->
  if $('body').data('controller') == 'shopping_carts' 
    if $('body').data('action') == 'show'
      shopping_cart.update_quantity_ui()




@shopping_cart =
  update_quantity_ui: ->
    $('*[data-content="update-cart-quantity"]').hide()
    $('*[data-content="cart-quantity-field"]').off()
    $('*[data-content="cart-quantity-field"]').on('input', ->
      $('*[data-content="saved-msg"]').addClass("hidden")
      $('*[data-content="update-cart-quantity"]', $(this).parents('form')).show()
      )