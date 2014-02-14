require 'test_helper'

class SitePhotosControllerTest < ActionController::TestCase
  setup do
    @site_photo = site_photos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:site_photos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create site_photo" do
    assert_difference('SitePhoto.count') do
      post :create, site_photo: { name: @site_photo.name }
    end

    assert_redirected_to site_photo_path(assigns(:site_photo))
  end

  test "should show site_photo" do
    get :show, id: @site_photo
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @site_photo
    assert_response :success
  end

  test "should update site_photo" do
    patch :update, id: @site_photo, site_photo: { name: @site_photo.name }
    assert_redirected_to site_photo_path(assigns(:site_photo))
  end

  test "should destroy site_photo" do
    assert_difference('SitePhoto.count', -1) do
      delete :destroy, id: @site_photo
    end

    assert_redirected_to site_photos_path
  end
end
