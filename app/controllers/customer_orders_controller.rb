class CustomerOrdersController < ApplicationController
  before_action :set_customer_order, only: [:show, :edit, :update, :destroy]

  # GET /customer_orders
  # GET /customer_orders.json
  def index
    @customer_orders = CustomerOrder.all
  end

  # GET /customer_orders/1
  # GET /customer_orders/1.json
  def show
  end

  def complete
    @customer_order = CustomerOrder.find(session[:customer_order_id])
  end

  # GET /customer_orders/new
  def new
    @customer_order = CustomerOrder.new
    @shopping_cart = ShoppingCart.find(session[:shopping_cart_id])
  end

  # GET /customer_orders/1/edit
  def edit
  end

  # POST /customer_orders
  # POST /customer_orders.json
  def create
    @customer_order = CustomerOrder.new(customer_order_params)
    @shopping_cart = ShoppingCart.find(session[:shopping_cart_id])
    @customer_order.shopping_cart_id = @shopping_cart.id
    @customer_order.shopping_cart_total = @shopping_cart.total
    
    respond_to do |format|
      if @customer_order.save
        create_charge
        session[:customer_order_id] = @customer_order.id
        session[:shopping_cart_id] = nil
        
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
                                             :shopping_cart_id, 
                                             :shopping_cart_total, 
                                             :comments,
                                             :stripe_card_token)
    end
    
    def create_charge
     # Get the credit card details submitted by the form
      token = params[:stripe_card_token]
      
      # Create the charge on Stripe's servers - this will charge the user's card
      begin
        charge = Stripe::Charge.create(
          :amount => (@shopping_cart.total * 100).to_i, # amount in cents, again
          :currency => "usd",
          :card => token,
          :description => @customer_order.email 
        )
      rescue Stripe::CardError => e
        # The card has been declined
      end
    end
end
