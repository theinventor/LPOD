require 'test_helper'

class LandingPagesControllerTest < ActionController::TestCase
  setup do
    @landing_page = landing_pages(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:landing_pages)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create landing_page" do
    assert_difference('LandingPage.count') do
      post :create, landing_page: @landing_page.attributes
    end

    assert_redirected_to landing_page_path(assigns(:landing_page))
  end

  test "should show landing_page" do
    get :show, id: @landing_page.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @landing_page.to_param
    assert_response :success
  end

  test "should update landing_page" do
    put :update, id: @landing_page.to_param, landing_page: @landing_page.attributes
    assert_redirected_to landing_page_path(assigns(:landing_page))
  end

  test "should destroy landing_page" do
    assert_difference('LandingPage.count', -1) do
      delete :destroy, id: @landing_page.to_param
    end

    assert_redirected_to landing_pages_path
  end
end
