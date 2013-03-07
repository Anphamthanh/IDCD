class PageHeadingsController < ApplicationController
  # GET /page_headings
  # GET /page_headings.json
  def index
    @page_headings = PageHeading.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @page_headings }
    end
  end

  # GET /page_headings/1
  # GET /page_headings/1.json
  def show
    @page_heading = PageHeading.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @page_heading }
    end
  end

  # GET /page_headings/new
  # GET /page_headings/new.json
  def new
    @page_heading = PageHeading.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @page_heading }
    end
  end

  # GET /page_headings/1/edit
  def edit
    @page_heading = PageHeading.find(params[:id])
  end

  # POST /page_headings
  # POST /page_headings.json
  def create
    @page_heading = PageHeading.new(params[:page_heading])

    respond_to do |format|
      if @page_heading.save
        PageItem.create(:item_id => @page_heading.id, :page_id => params[:page][:page_id], :type => "PageHeading")
        format.html { redirect_to edit_page_path(params[:page][:page_id]), notice: 'Page heading was successfully created.' }
        format.json { render json: @page_heading, status: :created, location: @page_heading }
      else
        format.html { render action: "new" }
        format.json { render json: @page_heading.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /page_headings/1
  # PUT /page_headings/1.json
  def update
    @page_heading = PageHeading.find(params[:id])

    respond_to do |format|
      if @page_heading.update_attributes(params[:page_heading])
        format.html { redirect_to edit_page_path(params[:page][:page_id]), notice: 'Page heading was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @page_heading.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /page_headings/1
  # DELETE /page_headings/1.json
  def destroy
    @page_heading = PageHeading.find(params[:id])
    @page_heading.destroy
  
    respond_to do |format|
      format.html { redirect_to page_headings_url}
      format.json { head :no_content }
    end
  end
end
