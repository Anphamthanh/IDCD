require 'test_helper'

class PageCarouselsControllerTest < ActionController::TestCase
  setup do
    @page_carousel = page_carousels(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:page_carousels)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create page_carousel" do
    assert_difference('PageCarousel.count') do
      post :create, page_carousel: { name: @page_carousel.name }
    end

    assert_redirected_to page_carousel_path(assigns(:page_carousel))
  end

  test "should show page_carousel" do
    get :show, id: @page_carousel
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @page_carousel
    assert_response :success
  end

  test "should update page_carousel" do
    put :update, id: @page_carousel, page_carousel: { name: @page_carousel.name }
    assert_redirected_to page_carousel_path(assigns(:page_carousel))
  end

  test "should destroy page_carousel" do
    assert_difference('PageCarousel.count', -1) do
      delete :destroy, id: @page_carousel
    end

    assert_redirected_to page_carousels_path
  end
end
