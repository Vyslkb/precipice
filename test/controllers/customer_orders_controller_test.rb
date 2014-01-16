require 'test_helper'

class CustomerOrdersControllerTest < ActionController::TestCase
  setup do
    @customer_order = customer_orders(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:customer_orders)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create customer_order" do
    assert_difference('CustomerOrder.count') do
      post :create, customer_order: { adddress_line_1: @customer_order.adddress_line_1, address_line_2: @customer_order.address_line_2, city: @customer_order.city, comments: @customer_order.comments, email: @customer_order.email, first_name: @customer_order.first_name, last_name: @customer_order.last_name, phone_number: @customer_order.phone_number, ship_to_first_name: @customer_order.ship_to_first_name, ship_to_last_name: @customer_order.ship_to_last_name, shopping_cart_id: @customer_order.shopping_cart_id, shopping_cart_total: @customer_order.shopping_cart_total, state: @customer_order.state, zip_code: @customer_order.zip_code }
    end

    assert_redirected_to customer_order_path(assigns(:customer_order))
  end

  test "should show customer_order" do
    get :show, id: @customer_order
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @customer_order
    assert_response :success
  end

  test "should update customer_order" do
    patch :update, id: @customer_order, customer_order: { adddress_line_1: @customer_order.adddress_line_1, address_line_2: @customer_order.address_line_2, city: @customer_order.city, comments: @customer_order.comments, email: @customer_order.email, first_name: @customer_order.first_name, last_name: @customer_order.last_name, phone_number: @customer_order.phone_number, ship_to_first_name: @customer_order.ship_to_first_name, ship_to_last_name: @customer_order.ship_to_last_name, shopping_cart_id: @customer_order.shopping_cart_id, shopping_cart_total: @customer_order.shopping_cart_total, state: @customer_order.state, zip_code: @customer_order.zip_code }
    assert_redirected_to customer_order_path(assigns(:customer_order))
  end

  test "should destroy customer_order" do
    assert_difference('CustomerOrder.count', -1) do
      delete :destroy, id: @customer_order
    end

    assert_redirected_to customer_orders_path
  end
end
