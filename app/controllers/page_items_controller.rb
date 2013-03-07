class PageItemsController < ApplicationController
  # GET /page_items
  # GET /page_items.json
  def index
    @page_items = PageItem.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @page_items }
    end
  end

def edit_item
    @page_item = PageItem.find(params[:id])

    if @page_item.type == "PageHeading" 
       respond_to do |format|
      format.html { redirect_to edit_page_heading_path(@page_item.item_id) }
      format.json { head :no_content }
    end
    end

    if @page_item.type == "PageSubheading" 
    end

    if @page_item.type == "PageText" 
    end
end

def delete_item
    @page_item = PageItem.find(params[:id])

    if @page_item.type == "PageHeading" 
     PageHeading.destroy_all(@page_item.item_id)
    end

    if @page_item.type == "PageSubheading" 
    end

    if @page_item.type == "PageText" 
    end

    @page_item.destroy

end

  # GET /page_items/1
  # GET /page_items/1.json
  def show
    @page_item = PageItem.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @page_item }
    end
  end

  # GET /page_items/new
  # GET /page_items/new.json
  def new
    @page_item = PageItem.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @page_item }
    end
  end

  # GET /page_items/1/edit
  def edit
    @page_item = PageItem.find(params[:id])
  end

  # POST /page_items
  # POST /page_items.json
  def create
    @page_item = PageItem.new(params[:page_item])

    respond_to do |format|
      if @page_item.save
        format.html { redirect_to @page_item, notice: 'Page item was successfully created.' }
        format.json { render json: @page_item, status: :created, location: @page_item }
      else
        format.html { render action: "new" }
        format.json { render json: @page_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /page_items/1
  # PUT /page_items/1.json
  def update
    @page_item = PageItem.find(params[:id])

    respond_to do |format|
      if @page_item.update_attributes(params[:page_item])
        format.html { redirect_to @page_item, notice: 'Page item was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @page_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /page_items/1
  # DELETE /page_items/1.json
  def destroy
    @page_item = PageItem.find(params[:id])
    @page_item.destroy

    respond_to do |format|
      format.html { redirect_to page_items_url }
      format.json { head :no_content }
    end
  end
end
