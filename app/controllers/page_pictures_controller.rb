class PagePicturesController < ApplicationController
  # GET /page_pictures
  # GET /page_pictures.json
  def index
    @page_pictures = PagePicture.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @page_pictures }
    end
  end

  # GET /page_pictures/1
  # GET /page_pictures/1.json
  def show
    @page_picture = PagePicture.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @page_picture }
    end
  end

  # GET /page_pictures/new
  # GET /page_pictures/new.json
  def new
    @page_picture = PagePicture.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @page_picture }
    end
  end

  # GET /page_pictures/1/edit
  def edit
    @page_picture = PagePicture.find(params[:id])
  end

  # POST /page_pictures
  # POST /page_pictures.json
  def create
    @page_picture = PagePicture.new(params[:page_picture])

    respond_to do |format|
      if @page_picture.save
        format.html { redirect_to @page_picture, notice: 'Page picture was successfully created.' }
        format.json { render json: @page_picture, status: :created, location: @page_picture }
      else
        format.html { render action: "new" }
        format.json { render json: @page_picture.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /page_pictures/1
  # PUT /page_pictures/1.json
  def update
    @page_picture = PagePicture.find(params[:id])

    respond_to do |format|
      if @page_picture.update_attributes(params[:page_picture])
        format.html { redirect_to @page_picture, notice: 'Page picture was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @page_picture.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /page_pictures/1
  # DELETE /page_pictures/1.json
  def destroy
    @page_picture = PagePicture.find(params[:id])
    @page_picture.destroy

    respond_to do |format|
      format.html { redirect_to page_pictures_url }
      format.json { head :no_content }
    end
  end
end
