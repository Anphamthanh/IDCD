class TextsController < ApplicationController
  # GET /texts
  # GET /texts.json
  def index
    @page = Page.find(params[:page_id])
    @texts = Text.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @texts }
    end
  end

  # GET /texts/1
  # GET /texts/1.json
  def show
    @page = Page.find(params[:page_id])
    @text = Text.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @text }
    end
  end

  # GET /texts/new
  # GET /texts/new.json
  def new
    @page = Page.find(params[:page_id])
    @text = Text.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @text }
    end
  end

  # GET /texts/1/edit
  def edit
    @page = Page.find(params[:page_id])
    @text = Text.find(params[:id])
  end

  # POST /texts
  # POST /texts.json
  def create
    @page = Page.find(params[:page_id])
    @text = Text.new(params[:text])

    respond_to do |format|
      if @text.save
        format.html { redirect_to page_text_path(@page,@text), notice: 'Text was successfully created.' }
        format.json { render json: @text, status: :created, location: @text }
      else
        format.html { render action: "new" }
        format.json { render json: @text.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /texts/1
  # PUT /texts/1.json
  def update
    @page = Page.find(params[:page_id])
    @text = Text.find(params[:id])

    respond_to do |format|
      if @text.update_attributes(params[:text])
        format.html { redirect_to page_text_path(@page,@text), notice: 'Text was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @text.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /texts/1
  # DELETE /texts/1.json
  def destroy
    @page = Page.find(params[:page_id])
    @text = Text.find(params[:id])
    @text.destroy

    respond_to do |format|
      format.html { redirect_to page_texts_path(@page)}
      format.json { head :no_content }
    end
  end
end
