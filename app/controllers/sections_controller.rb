class SectionsController < ApplicationController
  # GET /sections
  # GET /sections.json
  def index
    @semester = Semester.find(params[:semester_id])
    @sections = @semester.sections

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @sections }
    end
  end

  # GET /sections/1
  # GET /sections/1.json
  def show
    @semester = Semester.find(params[:semester_id])
    @section = Section.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @section }
    end
  end

  # GET /sections/new
  # GET /sections/new.json
  def new
    @semester = Semester.find(params[:semester_id])
    @section = Section.new
    @section.semester_id = @semester.id

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @section }
    end
  end

  # GET /sections/1/edit
  def edit
    @semester = Semester.find(params[:semester_id])
    @section = @semester.sections.find(params[:id])
  end

  # POST /sections
  # POST /sections.json
  def create
    @semester = Semester.find(params[:semester_id])
    @section = Section.new(params[:section])

    respond_to do |format|
      if @section.save
        format.html { redirect_to semester_path(@semester), notice: 'Section was successfully created.' }
        format.json { render json: @section, status: :created, location: @section }
      else
        format.html { render action: "new" }
        format.json { render json: @section.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /sections/1
  # PUT /sections/1.json
  def update
    @semester = Semester.find(params[:semester_id])
    @section = @semester.section.find(params[:id])

    respond_to do |format|
      if @section.update_attributes(params[:section])
        format.html { redirect_to @section, notice: 'Section was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @section.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sections/1
  # DELETE /sections/1.json
  def destroy
    @semester = Semester.find(params[:semester_id])
    @section = @semester.sections.find(params[:id])
    @section.destroy

    respond_to do |format|
      format.html { redirect_to semester_path(@semester) }
      format.json { head :no_content }
    end
  end
end
