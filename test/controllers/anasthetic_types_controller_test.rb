require 'test_helper'

class AnastheticTypesControllerTest < ActionController::TestCase
  setup do
    @anasthetic_type = anasthetic_types(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:anasthetic_types)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create anasthetic_type" do
    assert_difference('AnastheticType.count') do
      post :create, anasthetic_type: {  }
    end

    assert_redirected_to anasthetic_type_path(assigns(:anasthetic_type))
  end

  test "should show anasthetic_type" do
    get :show, id: @anasthetic_type
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @anasthetic_type
    assert_response :success
  end

  test "should update anasthetic_type" do
    patch :update, id: @anasthetic_type, anasthetic_type: {  }
    assert_redirected_to anasthetic_type_path(assigns(:anasthetic_type))
  end

  test "should destroy anasthetic_type" do
    assert_difference('AnastheticType.count', -1) do
      delete :destroy, id: @anasthetic_type
    end

    assert_redirected_to anasthetic_types_path
  end
end
