class ProposalStatusTypesController < ApplicationController
  # GET /proposal_status_types
  # GET /proposal_status_types.json
  def index
    @proposal_status_types = ProposalStatusType.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @proposal_status_types }
    end
  end

  # GET /proposal_status_types/1
  # GET /proposal_status_types/1.json
  def show
    @proposal_status_type = ProposalStatusType.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @proposal_status_type }
    end
  end

  # GET /proposal_status_types/new
  # GET /proposal_status_types/new.json
  def new
    @proposal_status_type = ProposalStatusType.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @proposal_status_type }
    end
  end

  # GET /proposal_status_types/1/edit
  def edit
    @proposal_status_type = ProposalStatusType.find(params[:id])
  end

  # POST /proposal_status_types
  # POST /proposal_status_types.json
  def create
    @proposal_status_type = ProposalStatusType.new(params[:proposal_status_type])

    respond_to do |format|
      if @proposal_status_type.save
        format.html { redirect_to @proposal_status_type, notice: 'Proposal status type was successfully created.' }
        format.json { render json: @proposal_status_type, status: :created, location: @proposal_status_type }
      else
        format.html { render action: "new" }
        format.json { render json: @proposal_status_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /proposal_status_types/1
  # PUT /proposal_status_types/1.json
  def update
    @proposal_status_type = ProposalStatusType.find(params[:id])

    respond_to do |format|
      if @proposal_status_type.update_attributes(params[:proposal_status_type])
        format.html { redirect_to @proposal_status_type, notice: 'Proposal status type was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @proposal_status_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /proposal_status_types/1
  # DELETE /proposal_status_types/1.json
  def destroy
    @proposal_status_type = ProposalStatusType.find(params[:id])
    @proposal_status_type.destroy

    respond_to do |format|
      format.html { redirect_to proposal_status_types_url }
      format.json { head :no_content }
    end
  end
end
