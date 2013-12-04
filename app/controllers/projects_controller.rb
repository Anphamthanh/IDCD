class ProjectsController < ApplicationController

  skip_before_filter :require_login, :only => [:new, :create, :confirmation]

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

  def faculty_approve
    fpd = FacultyProjectDecision.where(faculty_id: params[:faculty_id], project_id: params[:id]).first
    fpd.decision = true

    respond_to do |format|
      if fpd.save
        format.html { redirect_to :back, notice: 'Project was successfully marked as Accepted.' }
        format.json { render json: @projects }
      else
        format.html { redirect_to :back, notice: 'Project could NOT be marked as Accepted.' }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  def faculty_reject
    fpd = FacultyProjectDecision.where(faculty_id: params[:faculty_id], project_id: params[:id]).first
    fpd.decision = false

    respond_to do |format|
      if fpd.save
        format.html { redirect_to :back, notice: 'Project was successfully marked as Rejected.' }
        format.json { render json: @projects }
      else
        format.html { redirect_to :back, notice: 'Project could NOT be marked as Rejected.' }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  def admin_accept
    @project = Project.find(params[:id])

    # if the project is currently "rejected" mark it as "completed" so that the
    # user can select the appropriate terms and schools
    if @project.rejected?
      @project.complete!
      @project.save
      respond_to do |format|
        format.html { redirect_to project_path(@project) and return}
        format.json { render json: @project }
      end
    end

    selectedSchools = params[:selectedSchools]
    requiredSchools = params[:selectedRequiredSchools]
    selectedSemester = params[:selectedSemester]

    if selectedSchools.blank?
      flash[:error] ||= []
      flash[:error] << "Project must be assigned to at least one school."
    end
    if requiredSchools.blank?
      flash[:error] ||= []
      flash[:error] << "Project must be assigned to at least one required school."
    end
    if selectedSemester.blank?
      flash[:error] ||= []
      flash[:error] << "Project must be assigned to at least one semester."
    end

    if flash[:error]
      respond_to do |format|
        format.html { redirect_to project_path(@project) and return}
        format.json { render json: @project }
      end
    end

    @project.schools << School.find(params[:selectedSchools])
    params[:selectedRequiredSchools].each do |school_id|
      ProjectSchool.create(project_id: @project.id, school_id: school_id, required: true)
    end
    @project.semester_id = selectedSemester[0]
    @project.accept!

    respond_to do |format|
      if @project.save
        format.html { redirect_to project_path(@project), notice: 'Project was successfully marked as Accepted.' }
        format.json { render json: @projects }
      else
        format.html { redirect_to :action => "index", notice: 'Project could NOT be marked as Accepted.' }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  def admin_reject
    @project = Project.find(params[:id])
    @project.reject!
    @project.schools.clear
    @project.semester_id = nil

    respond_to do |format|
      if @project.save
        format.html { redirect_to project_path(@project), notice: 'Project was successfully marked as Rejected.' }
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
    if current_user.isAdmin?
      @incomplete_projects = Project.where(project_status_id: 1)
      @complete_projects = Project.where(project_status_id: 2)
      @accepted_projects = Project.where(project_status_id: 3, semester_id: session[:current_semester].id)
      @rejected_projects = Project.where(project_status_id: 4)

      respond_to do |format|
        format.html { render 'index_admin' }
        format.json { render json: @projects }
      end

    elsif current_user.isStudent?
      #TODO also limit by current semester
      @all_projects = Project.where(project_status_id: 3, semester_id: session[:current_semester].id)
      if current_user.is_owner?
        @available_projects = current_user.my_group.available_project_choices(session[:current_semester].id)
      else
        @available_projects = []
      end

      respond_to do |format|
        format.html { render 'index_student' }
        format.json { render json: @projects }
      end

    elsif current_user.isFaculty?
      @accepted_projects = current_user.approved_projects(session[:current_semester].id)
      @all_projects = Project.where(project_status_id: 3, semester_id: session[:current_semester].id)

      respond_to do |format|
        format.html { render 'index_faculty' }
        format.json { render json: @projects }
      end

    else
      @projects = Project.all
      respond_to do |format|
        format.html 
        format.json { render json: @projects }
      end

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
    elsif !@project.submitter
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
      @project.complete!

    elsif params[:manual]
      # If submitted by uploading a form, mark project as incomplete
      @project.incomplete!

    elsif params[:student]
      # If submitted by a student or a faculty, store the person's id
      @project.submitter = current_user
      @project.complete!

    else
      flash[:notice] = 'There was some problem. Please try again or contact us.'
      redirect_to action: "new"
      return

    end

    respond_to do |format|
      if @project.save
        format.html { redirect_to :action => "confirmation", :id => @project.id, notice: 'Project was successfully submitted.' }
        format.json { render json: @project, status: :created, location: @project }
      else
        format.html { render action: "new", notice: 'There was some problem. Please try again or contact us.' }
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
      @project.complete!
    elsif !@project.submitter
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
