class SubheadingsController < ApplicationController
  # GET /subheadings
  # GET /subheadings.json
  def index
    @subheadings = Subheading.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @subheadings }
    end
  end

  # GET /subheadings/1
  # GET /subheadings/1.json
  def show
    @subheading = Subheading.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @subheading }
    end
  end

  # GET /subheadings/new
  # GET /subheadings/new.json
  def new
    @subheading = Subheading.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @subheading }
    end
  end

  # GET /subheadings/1/edit
  def edit
    @subheading = Subheading.find(params[:id])
  end

  # POST /subheadings
  # POST /subheadings.json
  def create
    @subheading = Subheading.new(params[:subheading])

    respond_to do |format|
      if @subheading.save
        format.html { redirect_to @subheading, notice: 'Subheading was successfully created.' }
        format.json { render json: @subheading, status: :created, location: @subheading }
      else
        format.html { render action: "new" }
        format.json { render json: @subheading.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /subheadings/1
  # PUT /subheadings/1.json
  def update
    @subheading = Subheading.find(params[:id])

    respond_to do |format|
      if @subheading.update_attributes(params[:subheading])
        format.html { redirect_to @subheading, notice: 'Subheading was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @subheading.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /subheadings/1
  # DELETE /subheadings/1.json
  def destroy
    @subheading = Subheading.find(params[:id])
    @subheading.destroy

    respond_to do |format|
      format.html { redirect_to subheadings_url }
      format.json { head :no_content }
    end
  end
end
