require 'test_helper'

class GroupProposalsControllerTest < ActionController::TestCase
  setup do
    @group_proposal = group_proposals(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:group_proposals)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create group_proposal" do
    assert_difference('GroupProposal.count') do
      post :create, group_proposal: { group_id: @group_proposal.group_id, proposal_id: @group_proposal.proposal_id }
    end

    assert_redirected_to group_proposal_path(assigns(:group_proposal))
  end

  test "should show group_proposal" do
    get :show, id: @group_proposal
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @group_proposal
    assert_response :success
  end

  test "should update group_proposal" do
    put :update, id: @group_proposal, group_proposal: { group_id: @group_proposal.group_id, proposal_id: @group_proposal.proposal_id }
    assert_redirected_to group_proposal_path(assigns(:group_proposal))
  end

  test "should destroy group_proposal" do
    assert_difference('GroupProposal.count', -1) do
      delete :destroy, id: @group_proposal
    end

    assert_redirected_to group_proposals_path
  end
end
