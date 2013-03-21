class ProjectsController < ApplicationController
  # GET /projects/1/complete
  # GET /projects/1/complete.json
  def complete
    @project = Project.find(params[:id])
    if @project.incomplete?
      @company = Company.new
    else
      @company = Company.find(@project.company_id)
    end

    respond_to do |format|
      format.html # complete.html.erb
      format.json { render json: @projects }
    end
  end

  # GET /projects/1/faculty_accept
  # GET /projects/1/faculty_accept.json
  def faculty_approve
    @project = Project.find(params[:id])
    @faculty = Faculty.find(params[:faculty_id])
    @project.approving_faculty << @faculty

    respond_to do |format|
      format.html { redirect_to :action => "index", notice: 'Project was successfully marked as Accepted.' }
      format.json { render json: @projects }
    end
  end

  # GET /projects/1/faculty_reject
  # GET /projects/1/faculty_reject.json
  def faculty_reject
    @project = Project.find(params[:id])
    @project.status_id = 4

    respond_to do |format|
      if @project.save
        format.html { redirect_to :action => "index", notice: 'Project was successfully marked as Rejected.' }
        format.json { render json: @projects }
      else
        format.html { redirect_to :action => "index", notice: 'Project could NOT be marked as Rejected.' }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  # GET /projects/1/accept
  # GET /projects/1/accept.json
  def accept
    @project = Project.find(params[:id])
    @project.status_id = 3

    respond_to do |format|
      if @project.save
        format.html { redirect_to :action => "index", notice: 'Project was successfully marked as Accepted.' }
        format.json { render json: @projects }
      else
        format.html { redirect_to :action => "index", notice: 'Project could NOT be marked as Accepted.' }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  # GET /projects/1/rejected
  # GET /projects/1/rejected.json
  def reject
    @project = Project.find(params[:id])
    @project.status_id = 4

    respond_to do |format|
      if @project.save
        format.html { redirect_to :action => "index", notice: 'Project was successfully marked as Rejected.' }
        format.json { render json: @projects }
      else
        format.html { redirect_to :action => "index", notice: 'Project could NOT be marked as Rejected.' }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  # GET /projects/1/confirmation
  # GET /projects/1/confirmation.json
  def confirmation
    @project = Project.find(params[:id])

    respond_to do |format|
      format.html # confirmation.html.erb
      format.json { render json: @projects }
    end
  end

   # GET /projects
  # GET /projects.json
  def index
    @projects = Project.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @projects }
    end
  end

  # GET /projects/1
  # GET /projects/1.json
  def show
    @project = Project.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @project }
    end
  end

  # GET /projects/new
  # GET /projects/new.json
  def new
    @project = Project.new
    @company = Company.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @project }
    end
  end

  # GET /projects/1/edit
  def edit
    @project = Project.find(params[:id])
    if @project.incomplete?
      @company = Company.new
    else
      @company = Company.find(@project.company_id)
    end
  end

  # POST /projects
  # POST /projects.json
  def create
    @project = Project.new(params[:project])

    if params[:online]
      # If submitted online, the project will have a company associated with it
      @company = Company.create(params[:company])
      @project.company_id = @company.id
      @project.status_id = 2
    elsif params[:manual]
      # If submitted by uploading a form, mark project as incomplete
      @project.status_id = 1
    else
      render action: "new"
    end

    respond_to do |format|
      if @project.save
        format.html { redirect_to :action => "confirmation", :id => @project.id, notice: 'Project was successfully created.' }
        format.json { render json: @project, status: :created, location: @project }
      else
        format.html { render action: "new" }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /projects/1
  # PUT /projects/1.json
  def update
    @project = Project.find(params[:id])
    # if project was previously incomplete. 
    if @project.incomplete?
      @company = Company.create(params[:company])
      @project.company_id = @company.id
      @project.status_id = 2
    else
      @company = Company.find(@project.company_id)
      @company.update_attributes(params[:company])
    end

    respond_to do |format|
      if @project.update_attributes(params[:project])
        format.html { redirect_to @project, notice: 'Project was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /projects/1
  # DELETE /projects/1.json
  def destroy
    @project = Project.find(params[:id])
    @project.destroy

    respond_to do |format|
      format.html { redirect_to projects_url }
      format.json { head :no_content }
    end
  end
end
