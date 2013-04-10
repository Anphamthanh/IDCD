require 'test_helper'

class ProposalStatusTypesControllerTest < ActionController::TestCase
  setup do
    @proposal_status_type = proposal_status_types(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:proposal_status_types)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create proposal_status_type" do
    assert_difference('ProposalStatusType.count') do
      post :create, proposal_status_type: { name: @proposal_status_type.name }
    end

    assert_redirected_to proposal_status_type_path(assigns(:proposal_status_type))
  end

  test "should show proposal_status_type" do
    get :show, id: @proposal_status_type
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @proposal_status_type
    assert_response :success
  end

  test "should update proposal_status_type" do
    put :update, id: @proposal_status_type, proposal_status_type: { name: @proposal_status_type.name }
    assert_redirected_to proposal_status_type_path(assigns(:proposal_status_type))
  end

  test "should destroy proposal_status_type" do
    assert_difference('ProposalStatusType.count', -1) do
      delete :destroy, id: @proposal_status_type
    end

    assert_redirected_to proposal_status_types_path
  end
end
