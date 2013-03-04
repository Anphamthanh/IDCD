class PageCarouselsController < ApplicationController
  # GET /page_carousels
  # GET /page_carousels.json
  def index
    @page_carousels = PageCarousel.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @page_carousels }
    end
  end

  # GET /page_carousels/1
  # GET /page_carousels/1.json
  def show
    @page_carousel = PageCarousel.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @page_carousel }
    end
  end

  # GET /page_carousels/new
  # GET /page_carousels/new.json
  def new
    @page_carousel = PageCarousel.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @page_carousel }
    end
  end

  # GET /page_carousels/1/edit
  def edit
    @page_carousel = PageCarousel.find(params[:id])
  end

  # POST /page_carousels
  # POST /page_carousels.json
  def create
    @page_carousel = PageCarousel.new(params[:page_carousel])

    respond_to do |format|
      if @page_carousel.save
        PageItem.create(:item_id => @page_carousel.id, :page_id => params[:page][:page_id], :type => "PageCarousel")

        format.html { redirect_to @page_carousel, notice: 'Page carousel was successfully created.' }
        format.json { render json: @page_carousel, status: :created, location: @page_carousel }
      else
        format.html { render action: "new" }
        format.json { render json: @page_carousel.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /page_carousels/1
  # PUT /page_carousels/1.json
  def update
    @page_carousel = PageCarousel.find(params[:id])

    respond_to do |format|
      if @page_carousel.update_attributes(params[:page_carousel])
        format.html { redirect_to @page_carousel, notice: 'Page carousel was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @page_carousel.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /page_carousels/1
  # DELETE /page_carousels/1.json
  def destroy
    @page_carousel = PageCarousel.find(params[:id])
    @page_carousel.destroy

    respond_to do |format|
      format.html { redirect_to page_carousels_url }
      format.json { head :no_content }
    end
  end
end
