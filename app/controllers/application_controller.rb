class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :get_visitor_cart
  #before_filter :reset
  
  def reset
    reset_session
  end
  
  
  
  def page_not_found
    respond_to do |format|
      format.html { render template: 'errors/not_found_error', layout: 'layouts/application', status: 404 }
      format.all  { render nothing: true, status: 404 }
    end
  end

  def server_error
    
    respond_to do |format|
      format.html { render template: 'errors/internal_server_error', layout: 'layouts/application', status: 500 }
      format.all  { render nothing: true, status: 500}
    end
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
  
  private
  def render_error(status, exception)
    respond_to do |format|
      format.html { render template: "errors/error_#{status}", layout: 'layouts/application', status: status }
      format.all { render nothing: true, status: status }
    end
  end
   
end
