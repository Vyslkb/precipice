require 'test_helper'

class PrintTypesControllerTest < ActionController::TestCase
  setup do
    @print_type = print_types(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:print_types)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create print_type" do
    assert_difference('PrintType.count') do
      post :create, print_type: { display_order: @print_type.display_order, name: @print_type.name }
    end

    assert_redirected_to print_type_path(assigns(:print_type))
  end

  test "should show print_type" do
    get :show, id: @print_type
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @print_type
    assert_response :success
  end

  test "should update print_type" do
    patch :update, id: @print_type, print_type: { display_order: @print_type.display_order, name: @print_type.name }
    assert_redirected_to print_type_path(assigns(:print_type))
  end

  test "should destroy print_type" do
    assert_difference('PrintType.count', -1) do
      delete :destroy, id: @print_type
    end

    assert_redirected_to print_types_path
  end
end
