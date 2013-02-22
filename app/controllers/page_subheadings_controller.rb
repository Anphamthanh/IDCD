class PageSubheadingsController < ApplicationController
  # GET /page_subheadings
  # GET /page_subheadings.json
  def index
    @page_subheadings = PageSubheading.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @page_subheadings }
    end
  end

  # GET /page_subheadings/1
  # GET /page_subheadings/1.json
  def show
    @page_subheading = PageSubheading.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @page_subheading }
    end
  end

  # GET /page_subheadings/new
  # GET /page_subheadings/new.json
  def new
    @page_subheading = PageSubheading.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @page_subheading }
    end
  end

  # GET /page_subheadings/1/edit
  def edit
    @page_subheading = PageSubheading.find(params[:id])
  end

  # POST /page_subheadings
  # POST /page_subheadings.json
  def create
    @page_subheading = PageSubheading.new(params[:page_subheading])

    respond_to do |format|
      if @page_subheading.save
        PageItem.create(:item_id => @page_subheading.id, :page_id => params[:page][:page_id], :type => "PageSubheading")
        format.html { redirect_to :controller => 'pages', :action => 'edit', :id => params[:page][:page_id], notice: 'Page subheading was successfully created.' }
        format.json { render json: @page_subheading, status: :created, location: @page_subheading }
      else
        format.html { render action: "new" }
        format.json { render json: @page_subheading.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /page_subheadings/1
  # PUT /page_subheadings/1.json
  def update
    @page_subheading = PageSubheading.find(params[:id])

    respond_to do |format|
      if @page_subheading.update_attributes(params[:page_subheading])
        format.html { redirect_to @page_subheading, notice: 'Page subheading was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @page_subheading.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /page_subheadings/1
  # DELETE /page_subheadings/1.json
  def destroy
    @page_subheading = PageSubheading.find(params[:id])
    @page_subheading.destroy

    respond_to do |format|
      format.html { redirect_to page_subheadings_url }
      format.json { head :no_content }
    end
  end
end
