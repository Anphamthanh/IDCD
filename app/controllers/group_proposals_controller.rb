class GroupProposalsController < ApplicationController
  # GET /group_proposals
  # GET /group_proposals.json
  def index
    @group_proposals = GroupProposal.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @group_proposals }
    end
  end

  # GET /group_proposals/1
  # GET /group_proposals/1.json
  def show
    @group_proposal = GroupProposal.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @group_proposal }
    end
  end

  # GET /group_proposals/new
  # GET /group_proposals/new.json
  def new
    @group_proposal = GroupProposal.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @group_proposal }
    end
  end

  # GET /group_proposals/1/edit
  def edit
    @group_proposal = GroupProposal.find(params[:id])
  end

  # POST /group_proposals
  # POST /group_proposals.json
  def create
    @group_proposal = GroupProposal.new(params[:group_proposal])

    respond_to do |format|
      if @group_proposal.save
        format.html { redirect_to @group_proposal, notice: 'Group proposal was successfully created.' }
        format.json { render json: @group_proposal, status: :created, location: @group_proposal }
      else
        format.html { render action: "new" }
        format.json { render json: @group_proposal.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /group_proposals/1
  # PUT /group_proposals/1.json
  def update
    @group_proposal = GroupProposal.find(params[:id])

    respond_to do |format|
      if @group_proposal.update_attributes(params[:group_proposal])
        format.html { redirect_to @group_proposal, notice: 'Group proposal was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @group_proposal.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /group_proposals/1
  # DELETE /group_proposals/1.json
  def destroy
    @group_proposal = GroupProposal.find(params[:id])
    @group_proposal.destroy

    respond_to do |format|
      format.html { redirect_to group_proposals_url }
      format.json { head :no_content }
    end
  end
end
