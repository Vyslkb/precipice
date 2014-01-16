class ShoppingCartsController < ApplicationController

  def show
    #only show carts which are availabe to the user session
    get_visitor_cart
      
    if @shopping_cart.total_unique_items > 0
      render "show"
    else
      render "empty"
    end
  end
  
  
  
  def update
    get_visitor_cart
    
    # for now, assume that only the PhotoPrintOption class can be added to the card
    # this captures the photo and the size option all in one go
    if params[:cart_action] == "add"
      #verify params
      photo_print_option = PhotoPrintOption.find(params[:photo_print_option_id])
      
      if photo_print_option.present?
        @shopping_cart.add(photo_print_option, photo_print_option.print_option.price)
      end
      
      redirect_to shopping_cart_path
    
    elsif params[:cart_action] == "update_quantity"
      shopping_cart_item = ShoppingCartItem.find(params[:shopping_cart_item_id])
      if Array(0..99).include?(params[:item_quantity].to_i) 
        shopping_cart_item.quantity = params[:item_quantity].to_i
        shopping_cart_item.save
        shopping_cart_item.destroy if shopping_cart_item.quantity == 0
      end
      
      respond_to do |format|
        format.js
      end
    else
      redirect_to shopping_cart_path
    end
    
    
  end
  
  def checkout
    # Set your secret key: remember to change this to your live secret key in production
    # See your keys here https://manage.stripe.com/account
    
    #Stripe.api_key = "sk_test_DtlutWbhRy1T629i5mrocR56"
    @shopping_cart = ShoppingCart.find(session[:shopping_cart_id])
    
    
   
  end
  
  
  
  
end
