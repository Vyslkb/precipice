class ShoppingCartsController < ApplicationController
before_filter :authenticate_admin!, only: [:index, :destroy]

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
        
        @update_quantity = true
      end
      
      respond_to do |format|
        format.js
      end
    elsif params[:cart_action] == "update_discount_code"
      if DiscountCode.where(name: params[:discount_code]).exists?
        session[:discount_percentage] = DiscountCode.find_by_name(params[:discount_code]).discount_percentage 
        get_visitor_cart
        @shopping_cart.shopping_cart_items.each do |item|
          sticker_price = PhotoPrintOption.find(item.item_id).print_option.price
          item.price = (sticker_price * (100 - session[:discount_percentage]) / 100).round(2)
          item.save 
        end
        @update_discount_code = true
      else
        @error_msg = "Sorry, that is not a valid promo code."
      end
    
    else
      redirect_to shopping_cart_path
    end
    
    
  end
  
  def index
    @shopping_carts = ShoppingCart.order('updated_at desc')
   
  end
  
  def destroy
    @shopping_cart = ShoppingCart.find(params[:id])
    @shopping_cart.destroy
    respond_to do |format|
      format.html { redirect_to shopping_carts_url }
      format.json { head :no_content }
    end
  end
  
  
  
  
end
