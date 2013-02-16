require 'test_helper'

class PageSubheadingsControllerTest < ActionController::TestCase
  setup do
    @page_subheading = page_subheadings(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:page_subheadings)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create page_subheading" do
    assert_difference('PageSubheading.count') do
      post :create, page_subheading: { title: @page_subheading.title }
    end

    assert_redirected_to page_subheading_path(assigns(:page_subheading))
  end

  test "should show page_subheading" do
    get :show, id: @page_subheading
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @page_subheading
    assert_response :success
  end

  test "should update page_subheading" do
    put :update, id: @page_subheading, page_subheading: { title: @page_subheading.title }
    assert_redirected_to page_subheading_path(assigns(:page_subheading))
  end

  test "should destroy page_subheading" do
    assert_difference('PageSubheading.count', -1) do
      delete :destroy, id: @page_subheading
    end

    assert_redirected_to page_subheadings_path
  end
end
