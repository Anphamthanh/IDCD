class ProjectStatusTypesController < ApplicationController
  # GET /project_status_types
  # GET /project_status_types.json
  def index
    @project_status_types = ProjectStatus.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @project_status_types }
    end
  end

  # GET /project_status_types/1
  # GET /project_status_types/1.json
  def show
    @project_status_type = ProjectStatus.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @project_status_type }
    end
  end

  # GET /project_status_types/new
  # GET /project_status_types/new.json
  def new
    @project_status_type = ProjectStatus.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @project_status_type }
    end
  end

  # GET /project_status_types/1/edit
  def edit
    @project_status_type = ProjectStatus.find(params[:id])
  end

  # POST /project_status_types
  # POST /project_status_types.json
  def create
    @project_status_type = ProjectStatus.new(params[:project_status])

    respond_to do |format|
      if @project_status.save
        format.html { redirect_to @project_status_type, notice: 'Project status was successfully created.' }
        format.json { render json: @project_status_type, status: :created, location: @project_status_type }
      else
        format.html { render action: "new" }
        format.json { render json: @project_status_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /project_status_types/1
  # PUT /project_status_types/1.json
  def update
    @project_status_type = ProjectStatus.find(params[:id])

    respond_to do |format|
      if @project_status_type.update_attributes(params[:project_status])
        format.html { redirect_to @project_status_type, notice: 'Project status was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @project_status_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /project_status_types/1
  # DELETE /project_status_types/1.json
  def destroy
    @project_status_type = ProjectStatus.find(params[:id])
    @project_status_type.destroy

    respond_to do |format|
      format.html { redirect_to project_status_types_url }
      format.json { head :no_content }
    end
  end
end
