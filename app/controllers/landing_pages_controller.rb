class LandingPagesController < ApplicationController

  def index
    @landing_pages = LandingPage.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @landing_pages }
    end
  end

  def show
    @landing_page = LandingPage.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @landing_page }
    end
  end

  def new
    @landing_page = LandingPage.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @landing_page }
    end
  end

  def edit
    @landing_page = LandingPage.find(params[:id])
  end

  def create
    @landing_page = LandingPage.new(params[:landing_page])
    kit = IMGKit.new("#{@landing_page.url}")
    path = "#{Rails.root}/public/uploads/tmp/#{@landing_page.title.downcase.gsub(" ","_")}.png"
    file = kit.to_file(path)
    @landing_page.screen_shot = File.open(path)
    @landing_page.save!
    
    respond_to do |format|
      if @landing_page.save
        format.html { redirect_to @landing_page, notice: 'Landing page was successfully created.' }
        format.json { render json: @landing_page, status: :created, location: @landing_page }
      else
        format.html { render action: "new" }
        format.json { render json: @landing_page.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @landing_page = LandingPage.find(params[:id])

    respond_to do |format|
      if @landing_page.update_attributes(params[:landing_page])
        format.html { redirect_to @landing_page, notice: 'Landing page was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @landing_page.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @landing_page = LandingPage.find(params[:id])
    @landing_page.destroy

    respond_to do |format|
      format.html { redirect_to landing_pages_url }
      format.json { head :ok }
    end
  end
end
