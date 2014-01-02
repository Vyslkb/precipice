require 'test_helper'

class PrintOptionsControllerTest < ActionController::TestCase
  setup do
    @print_option = print_options(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:print_options)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create print_option" do
    assert_difference('PrintOption.count') do
      post :create, print_option: { name: @print_option.name, price: @print_option.price, size: @print_option.size }
    end

    assert_redirected_to print_option_path(assigns(:print_option))
  end

  test "should show print_option" do
    get :show, id: @print_option
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @print_option
    assert_response :success
  end

  test "should update print_option" do
    patch :update, id: @print_option, print_option: { name: @print_option.name, price: @print_option.price, size: @print_option.size }
    assert_redirected_to print_option_path(assigns(:print_option))
  end

  test "should destroy print_option" do
    assert_difference('PrintOption.count', -1) do
      delete :destroy, id: @print_option
    end

    assert_redirected_to print_options_path
  end
end
