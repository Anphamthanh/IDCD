require 'test_helper'

class SubheadingsControllerTest < ActionController::TestCase
  setup do
    @subheading = subheadings(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:subheadings)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create subheading" do
    assert_difference('Subheading.count') do
      post :create, subheading: { title: @subheading.title }
    end

    assert_redirected_to subheading_path(assigns(:subheading))
  end

  test "should show subheading" do
    get :show, id: @subheading
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @subheading
    assert_response :success
  end

  test "should update subheading" do
    put :update, id: @subheading, subheading: { title: @subheading.title }
    assert_redirected_to subheading_path(assigns(:subheading))
  end

  test "should destroy subheading" do
    assert_difference('Subheading.count', -1) do
      delete :destroy, id: @subheading
    end

    assert_redirected_to subheadings_path
  end
end
