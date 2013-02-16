require 'test_helper'

class PagePicturesControllerTest < ActionController::TestCase
  setup do
    @page_picture = page_pictures(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:page_pictures)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create page_picture" do
    assert_difference('PagePicture.count') do
      post :create, page_picture: { name: @page_picture.name, picture: @page_picture.picture }
    end

    assert_redirected_to page_picture_path(assigns(:page_picture))
  end

  test "should show page_picture" do
    get :show, id: @page_picture
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @page_picture
    assert_response :success
  end

  test "should update page_picture" do
    put :update, id: @page_picture, page_picture: { name: @page_picture.name, picture: @page_picture.picture }
    assert_redirected_to page_picture_path(assigns(:page_picture))
  end

  test "should destroy page_picture" do
    assert_difference('PagePicture.count', -1) do
      delete :destroy, id: @page_picture
    end

    assert_redirected_to page_pictures_path
  end
end
