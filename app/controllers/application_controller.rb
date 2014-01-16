class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  before_filter :check_session
  helper_method :get_visitor_cart
  
  
  def check_session
    #reset_session
    #if session[:expires_at].present?
    ##  if session[:expires_at] < Time.now 
    #    reset_session
    #    session[:expires_at] = Time.now + 24.hours
    #  end
    #else 
    #  session[:expires_at] = Time.now + 24.hours  
    #end
  end
  
  def get_visitor_cart
    if session[:shopping_cart_id].present?
      if ShoppingCart.where(id: session[:shopping_cart_id]).exists?
        shopping_cart = ShoppingCart.find(session[:shopping_cart_id])
      else
        shopping_cart = ShoppingCart.create  
        session[:shopping_cart_id] = shopping_cart.id
      end
    else 
      shopping_cart = ShoppingCart.create  
      session[:shopping_cart_id] = shopping_cart.id
    end
    
    @shopping_cart = shopping_cart
  end
  
end
