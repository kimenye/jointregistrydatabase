require 'test_helper'

class ImplantIndicationsControllerTest < ActionController::TestCase
  setup do
    @implant_indication = implant_indications(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:implant_indications)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create implant_indication" do
    assert_difference('ImplantIndication.count') do
      post :create, implant_indication: {  }
    end

    assert_redirected_to implant_indication_path(assigns(:implant_indication))
  end

  test "should show implant_indication" do
    get :show, id: @implant_indication
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @implant_indication
    assert_response :success
  end

  test "should update implant_indication" do
    patch :update, id: @implant_indication, implant_indication: {  }
    assert_redirected_to implant_indication_path(assigns(:implant_indication))
  end

  test "should destroy implant_indication" do
    assert_difference('ImplantIndication.count', -1) do
      delete :destroy, id: @implant_indication
    end

    assert_redirected_to implant_indications_path
  end
end
