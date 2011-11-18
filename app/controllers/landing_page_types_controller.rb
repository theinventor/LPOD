class LandingPageTypesController < ApplicationController
  # GET /landing_page_types
  # GET /landing_page_types.json
  def index
    @landing_page_types = LandingPageType.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @landing_page_types }
    end
  end

  # GET /landing_page_types/1
  # GET /landing_page_types/1.json
  def show
    @landing_page_type = LandingPageType.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @landing_page_type }
    end
  end

  # GET /landing_page_types/new
  # GET /landing_page_types/new.json
  def new
    @landing_page_type = LandingPageType.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @landing_page_type }
    end
  end

  # GET /landing_page_types/1/edit
  def edit
    @landing_page_type = LandingPageType.find(params[:id])
  end

  # POST /landing_page_types
  # POST /landing_page_types.json
  def create
    @landing_page_type = LandingPageType.new(params[:landing_page_type])

    respond_to do |format|
      if @landing_page_type.save
        format.html { redirect_to @landing_page_type, notice: 'Landing page type was successfully created.' }
        format.json { render json: @landing_page_type, status: :created, location: @landing_page_type }
      else
        format.html { render action: "new" }
        format.json { render json: @landing_page_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /landing_page_types/1
  # PUT /landing_page_types/1.json
  def update
    @landing_page_type = LandingPageType.find(params[:id])

    respond_to do |format|
      if @landing_page_type.update_attributes(params[:landing_page_type])
        format.html { redirect_to @landing_page_type, notice: 'Landing page type was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @landing_page_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /landing_page_types/1
  # DELETE /landing_page_types/1.json
  def destroy
    @landing_page_type = LandingPageType.find(params[:id])
    @landing_page_type.destroy

    respond_to do |format|
      format.html { redirect_to landing_page_types_url }
      format.json { head :ok }
    end
  end
end
