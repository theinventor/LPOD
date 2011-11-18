require 'test_helper'

class LandingPageTypesControllerTest < ActionController::TestCase
  setup do
    @landing_page_type = landing_page_types(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:landing_page_types)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create landing_page_type" do
    assert_difference('LandingPageType.count') do
      post :create, landing_page_type: @landing_page_type.attributes
    end

    assert_redirected_to landing_page_type_path(assigns(:landing_page_type))
  end

  test "should show landing_page_type" do
    get :show, id: @landing_page_type.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @landing_page_type.to_param
    assert_response :success
  end

  test "should update landing_page_type" do
    put :update, id: @landing_page_type.to_param, landing_page_type: @landing_page_type.attributes
    assert_redirected_to landing_page_type_path(assigns(:landing_page_type))
  end

  test "should destroy landing_page_type" do
    assert_difference('LandingPageType.count', -1) do
      delete :destroy, id: @landing_page_type.to_param
    end

    assert_redirected_to landing_page_types_path
  end
end
