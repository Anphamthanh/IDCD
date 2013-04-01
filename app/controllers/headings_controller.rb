class HeadingsController < ApplicationController
  # GET /headings
  # GET /headings.json
  def index
    @page = Page.find(params[:page_id])
    @headings = Heading.all

    respond_to do |format|
      format.html # index.html.erb
      #format.json { render json: @headings }
    end
  end

  # GET /headings/1
  # GET /headings/1.json
  def show
    @page = Page.find(params[:page_id])
    @heading = Heading.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @heading }
    end
  end

  # GET /headings/new
  # GET /headings/new.json
  def new
    @page = Page.find(params[:page_id])
    @heading = Heading.new


    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @heading }
    end
  end

  # GET /headings/1/edit
  def edit
    @page = Page.find(params[:page_id])
    @heading = Heading.find(params[:id])
  end

  # POST /headings
  # POST /headings.json
  def create
    @page = Page.find(params[:page_id])
    @heading = Heading.new(params[:heading])

    respond_to do |format|
      if @heading.save
        format.html { redirect_to page_heading_path(@page,@heading), notice: 'Heading was successfully created.' }
        format.json { render json: @heading, status: :created, location: @heading }
      else
        format.html { render action: "new" }
        format.json { render json: @heading.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /headings/1
  # PUT /headings/1.json
  def update
    @page = Page.find(params[:page_id])
    @heading = Heading.find(params[:id])

    respond_to do |format|
      if @heading.update_attributes(params[:heading])
        format.html { redirect_to page_heading_path(@page,@heading), notice: 'Heading was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @heading.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /headings/1
  # DELETE /headings/1.json
  def destroy
    @page = Page.find(params[:page_id])
    @heading = Heading.find(params[:id])
    @heading.destroy

    respond_to do |format|
      format.html { redirect_to page_headings_path(@page) }
      format.json { head :no_content }
    end
  end
end
