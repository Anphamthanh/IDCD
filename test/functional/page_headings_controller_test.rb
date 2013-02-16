require 'test_helper'

class PageHeadingsControllerTest < ActionController::TestCase
  setup do
    @page_heading = page_headings(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:page_headings)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create page_heading" do
    assert_difference('PageHeading.count') do
      post :create, page_heading: { title: @page_heading.title }
    end

    assert_redirected_to page_heading_path(assigns(:page_heading))
  end

  test "should show page_heading" do
    get :show, id: @page_heading
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @page_heading
    assert_response :success
  end

  test "should update page_heading" do
    put :update, id: @page_heading, page_heading: { title: @page_heading.title }
    assert_redirected_to page_heading_path(assigns(:page_heading))
  end

  test "should destroy page_heading" do
    assert_difference('PageHeading.count', -1) do
      delete :destroy, id: @page_heading
    end

    assert_redirected_to page_headings_path
  end
end
