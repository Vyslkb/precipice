require 'test_helper'

class AdditionalContentsControllerTest < ActionController::TestCase
  setup do
    @additional_content = additional_contents(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:additional_contents)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create additional_content" do
    assert_difference('AdditionalContent.count') do
      post :create, additional_content: { contact: @additional_content.contact, philosophy: @additional_content.philosophy, prints_and_pricing: @additional_content.prints_and_pricing }
    end

    assert_redirected_to additional_content_path(assigns(:additional_content))
  end

  test "should show additional_content" do
    get :show, id: @additional_content
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @additional_content
    assert_response :success
  end

  test "should update additional_content" do
    patch :update, id: @additional_content, additional_content: { contact: @additional_content.contact, philosophy: @additional_content.philosophy, prints_and_pricing: @additional_content.prints_and_pricing }
    assert_redirected_to additional_content_path(assigns(:additional_content))
  end

  test "should destroy additional_content" do
    assert_difference('AdditionalContent.count', -1) do
      delete :destroy, id: @additional_content
    end

    assert_redirected_to additional_contents_path
  end
end
