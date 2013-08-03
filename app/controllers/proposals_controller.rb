class ProposalsController < ApplicationController

  # TODO - Is this the best/only way to avoid "Can't verify CSRF token authenticity" error?
  skip_before_filter :verify_authenticity_token, :only => [:destroy]

  def accept
    proposal = Proposal.find(params[:id])
    other_proposals = Proposal.where(project_id: proposal.project_id)

    # mark other proposals for same project as rejected
    other_proposals.each do |p|
      p.reject!
      p.save
    end 

    # accept the correct proposal
    proposal.accept!
    proposal.save!

    redirect_to :action => "index"
  end

  def reject
    proposal = Proposal.find(params[:id])

    # reject the proposal
    proposal.reject!
    proposal.save!

    redirect_to :action => "index"
  end

  def mark_pending
    proposal = Proposal.find(params[:id])
    all_proposals_for_project = Proposal.where(project_id: proposal.project_id)

    # mark other proposals for same project as pending
    all_proposals_for_project.each do |p|
      p.pending!
      p.save
    end 

    redirect_to :action => "index"
  end

  # GET /proposals
  # GET /proposals.json
  def index

    if current_user.isAdmin?
      @proposals = Proposal.all

      respond_to do |format|
        format.html # index.html.erb
        format.json { render json: @proposals }
      end

    elsif current_user.isStudent?
      @proposals = Proposal.all
      @proposal = Proposal.new

      respond_to do |format|
        format.html { render 'index_student' }
        format.json { render json: @proposals }
      end
    end

  end

  # GET /proposals/1
  # GET /proposals/1.json
  def show
    @proposal = Proposal.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @proposal }
    end
  end

  # GET /proposals/new
  # GET /proposals/new.json
  def new
    @proposal = Proposal.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @proposal }
    end
  end

  # GET /proposals/1/edit
  def edit
    @proposal = Proposal.find(params[:id])
  end

  # POST /proposals
  # POST /proposals.json
  def create
    @proposal = Proposal.new(params[:proposal])
    @proposal.group_id = current_user.my_group.id

    # check of duplicate proposal by the same group for the same project
    # done in the model

    respond_to do |format|
      if @proposal.save
        format.html { redirect_to proposals_path, notice: 'Proposal was successfully created.' }
        format.json { render json: @proposal, status: :created, location: @proposal }
      else
        format.html { redirect_to proposals_path, notice: 'Proposal submission unsuccessful, most probably because of duplication. ' }
        format.json { render json: @proposal.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /proposals/1
  # PUT /proposals/1.json
  def update
    @proposal = Proposal.find(params[:id])

    respond_to do |format|
      if @proposal.update_attributes(params[:proposal])
        format.html { redirect_to proposals_path, notice: 'Proposal was successfully created.' }
        format.json { head :no_content }
      else
        format.html { redirect_to proposals_path, notice: 'Proposal submission unsuccessful, most probably because of duplication. ' }
        format.json { render json: @proposal.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /proposals/1
  # DELETE /proposals/1.json
  def destroy
    @proposal = Proposal.find(params[:id])
    @proposal.destroy

    respond_to do |format|
      format.html { redirect_to proposals_url }
      format.json { head :no_content }
    end
  end
end
