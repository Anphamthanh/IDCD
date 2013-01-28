require 'test_helper'

class PastProjectsControllerTest < ActionController::TestCase
  setup do
    @past_project = past_projects(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:past_projects)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create past_project" do
    assert_difference('PastProject.count') do
      post :create, past_project: { description1: @past_project.description1, description2: @past_project.description2, description3: @past_project.description3, description4: @past_project.description4, links: @past_project.links, picture1: @past_project.picture1, picture2: @past_project.picture2, picture3: @past_project.picture3, picture4: @past_project.picture4, title1: @past_project.title1, title2: @past_project.title2, title3: @past_project.title3, title4: @past_project.title4 }
    end

    assert_redirected_to past_project_path(assigns(:past_project))
  end

  test "should show past_project" do
    get :show, id: @past_project
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @past_project
    assert_response :success
  end

  test "should update past_project" do
    put :update, id: @past_project, past_project: { description1: @past_project.description1, description2: @past_project.description2, description3: @past_project.description3, description4: @past_project.description4, links: @past_project.links, picture1: @past_project.picture1, picture2: @past_project.picture2, picture3: @past_project.picture3, picture4: @past_project.picture4, title1: @past_project.title1, title2: @past_project.title2, title3: @past_project.title3, title4: @past_project.title4 }
    assert_redirected_to past_project_path(assigns(:past_project))
  end

  test "should destroy past_project" do
    assert_difference('PastProject.count', -1) do
      delete :destroy, id: @past_project
    end

    assert_redirected_to past_projects_path
  end
end
