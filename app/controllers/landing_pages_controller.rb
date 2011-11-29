class LandingPagesController < ApplicationController

  def index
    @landing_pages = LandingPage.all
    
    sidebar
    
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @landing_pages }
    end
  end

  def show
    @landing_page = LandingPage.find(params[:id])
    sidebar
    
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
  
  def vote
    @landing_page = LandingPage.find(params[:id])
    @vote = Vote.new
    @vote.value = "1"
    r = Random.new
    
    @vote.ip = (request.ip + Random.rand(1000-1).to_s)
    @vote.landing_page_id = @landing_page.id
    @vote.save! 
     
    respond_to do |format| 
      format.json {head:ok}
    end
  end 
  
  private
  
  def sidebar
    @industries = Industry.joins(:landing_pages).select('distinct industries.*').limit(10) 
    @lpt = LandingPageType.joins(:landing_pages).select('distinct landing_page_types.*').limit(10)
  end
end
