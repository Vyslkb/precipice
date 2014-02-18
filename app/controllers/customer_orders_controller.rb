class CustomerOrdersController < ApplicationController
  before_action :set_customer_order, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_admin!, only: [:index, :show, :edit, :update, :destroy]
  
  # GET /customer_orders
  # GET /customer_orders.json
  def index
    @customer_orders = CustomerOrder.order('created_at desc')
  end

  # GET /customer_orders/1
  # GET /customer_orders/1.json
  def show
  end

  def complete
    if CustomerOrder.exists?(session[:customer_order_id].to_i)
      @customer_order = CustomerOrder.find(session[:customer_order_id])
    else
      redirect_to order_error_path
    end
  end
  
  def charge_error
    
  end

  def order_error
    
  end

  # GET /customer_orders/new
  def new
    session[:shopping_cart_id] = params[:scid]
    
    get_visitor_cart
    if @shopping_cart.total_unique_items > 0
      @customer_order = CustomerOrder.new
    else
      redirect_to @shopping_cart
    end
  end

  # GET /customer_orders/1/edit
  def edit
  end

  # POST /customer_orders
  # POST /customer_orders.json
  def create
    @customer_order = CustomerOrder.new(customer_order_params)
    
    shopping_cart = ShoppingCart.find(session[:shopping_cart_id])
    @customer_order.subtotal = shopping_cart.subtotal
    @customer_order.shipping = shopping_cart.shipping_cost
    @customer_order.total = shopping_cart.total
    
    shopping_cart.shopping_cart_items.each do |shopping_cart_item|
      new_order_item = @customer_order.customer_order_items.new
      
      photo = PhotoPrintOption.find(shopping_cart_item.item_id).photo
      print_option = PhotoPrintOption.find(shopping_cart_item.item_id).print_option
      
      new_order_item.photo_name = photo.name
      new_order_item.photo_id = photo.id
      new_order_item.print_name = print_option.name
      new_order_item.print_cost = print_option.price     
      
      new_order_item.quantity = shopping_cart_item.quantity
    end
    
    
    respond_to do |format|
      if @customer_order.save
        create_charge(@customer_order.total)
        session[:customer_order_id] = @customer_order.id
        session[:shopping_cart_id] = nil
        AdminMailer.order_confirmation(@customer_order).deliver
        
        
        format.html { redirect_to order_complete_path }
        format.json { render action: 'show', status: :created, location: @customer_order }
      else
        format.html { render action: 'new' }
        format.json { render json: @customer_order.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /customer_orders/1
  # PATCH/PUT /customer_orders/1.json
  def update
    respond_to do |format|
      if @customer_order.update(customer_order_params)
        format.html { redirect_to @customer_order, notice: 'Customer order was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @customer_order.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /customer_orders/1
  # DELETE /customer_orders/1.json
  def destroy
    @customer_order.destroy
    respond_to do |format|
      format.html { redirect_to customer_orders_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_customer_order
      @customer_order = CustomerOrder.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def customer_order_params
      params.require(:customer_order).permit(:first_name, 
                                             :last_name, 
                                             :email, 
                                             :phone_number, 
                                             :ship_to_first_name, 
                                             :ship_to_last_name, 
                                             :address_line_1, 
                                             :address_line_2, 
                                             :city, 
                                             :state, 
                                             :zip_code,  
                                             :comments,
                                             :stripe_card_token)
    end
    
    def create_charge(charge_in_dollars)
     # Get the credit card details submitted by the form
      token = params[:stripe_card_token]
      
      # Create the charge on Stripe's servers - this will charge the user's card
      begin
        charge = Stripe::Charge.create(
          :amount => (charge_in_dollars * 100).to_i, # amount in cents, again
          :currency => "usd",
          :card => token,
          :description => @customer_order.email 
        )
      rescue Stripe::CardError => e
        redirect_to charge_error_path
      end
    end
end
