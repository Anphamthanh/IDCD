require 'test_helper'

class PageItemsControllerTest < ActionController::TestCase
  setup do
    @page_item = page_items(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:page_items)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create page_item" do
    assert_difference('PageItem.count') do
      post :create, page_item: { item_id: @page_item.item_id, page_id: @page_item.page_id }
    end

    assert_redirected_to page_item_path(assigns(:page_item))
  end

  test "should show page_item" do
    get :show, id: @page_item
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @page_item
    assert_response :success
  end

  test "should update page_item" do
    put :update, id: @page_item, page_item: { item_id: @page_item.item_id, page_id: @page_item.page_id }
    assert_redirected_to page_item_path(assigns(:page_item))
  end

  test "should destroy page_item" do
    assert_difference('PageItem.count', -1) do
      delete :destroy, id: @page_item
    end

    assert_redirected_to page_items_path
  end
end
