class SubheadingsController < ApplicationController
  # GET /subheadings
  # GET /subheadings.json
  def index
    @page = Page.find(params[:page_id])
    @subheadings = Subheading.all

    respond_to do |format|
      format.html # index.html.erb
    #  format.json { render json: @subheadings }
    end
  end

  # GET /subheadings/1
  # GET /subheadings/1.json
  def show
    @page = Page.find(params[:page_id])
    @subheading = Subheading.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @subheading }
    end
  end

  # GET /subheadings/new
  # GET /subheadings/new.json
  def new
    @page = Page.find(params[:page_id])
    @subheading = Subheading.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @subheading }
    end
  end

  # GET /subheadings/1/edit
  def edit
    @page = Page.find(params[:page_id])
    @subheading = Subheading.find(params[:id])
  end

  # POST /subheadings
  # POST /subheadings.json
  def create
    @page = Page.find(params[:page_id])
    @subheading = Subheading.new(params[:subheading])

    respond_to do |format|
      if @subheading.save
        format.html { redirect_to page_subheading_path(@page, @subheading), notice: 'Subheading was successfully created.' }
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
    @page = Page.find(params[:page_id])
    @subheading = Subheading.find(params[:id])

    respond_to do |format|
      if @subheading.update_attributes(params[:subheading])
        format.html { redirect_to page_subheading_path(@page,@subheading), notice: 'Subheading was successfully updated.' }
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
    @page = Page.find(params[:page_id])
    @subheading = Subheading.find(params[:id])
    @subheading.destroy

    respond_to do |format|
      format.html { redirect_to page_subheadings_path(@page) }
      format.json { head :no_content }
    end
  end
end
