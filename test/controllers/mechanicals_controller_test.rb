require 'test_helper'

class MechanicalsControllerTest < ActionController::TestCase
  setup do
    @mechanical = mechanicals(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:mechanicals)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create mechanical" do
    assert_difference('Mechanical.count') do
      post :create, mechanical: {  }
    end

    assert_redirected_to mechanical_path(assigns(:mechanical))
  end

  test "should show mechanical" do
    get :show, id: @mechanical
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @mechanical
    assert_response :success
  end

  test "should update mechanical" do
    patch :update, id: @mechanical, mechanical: {  }
    assert_redirected_to mechanical_path(assigns(:mechanical))
  end

  test "should destroy mechanical" do
    assert_difference('Mechanical.count', -1) do
      delete :destroy, id: @mechanical
    end

    assert_redirected_to mechanicals_path
  end
end
