class LandingPagesController < ApplicationController
  respond_to :html, :json, :js
  
  def index
    @landing_pages = LandingPage.paginate(:page => params[:page]).per_page(5).default 
    sidebar
  end

  def show
    @landing_page = LandingPage.find(params[:id])
    sidebar
  end

  def new
    @landing_page = LandingPage.new 
    landing_page_calendar
  end

  def edit
    @landing_page = LandingPage.find(params[:id])
    landing_page_calendar 
  end

  def create
    @landing_page = LandingPage.new(params[:landing_page])
    landing_page_calendar 
    
    respond_to do |format|
      if @landing_page.save
        format.html { redirect_to @landing_page, notice: 'The Landing Page was successfully created.' }
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
    
    @vote.ip = (request.ip + Random.rand(1000-1).to_s)
    @vote.landing_page_id = @landing_page.id
    @vote.save! 
    
    respond_to do |format| 
      format.json {head:ok}
    end 
  end 
  
  def landing_page_calendar
    @month = (params[:month] || (Time.zone || Time).now.month).to_i
    @year = (params[:year] || (Time.zone || Time).now.year).to_i

    @shown_month = Date.civil(@year, @month)

    @event_strips = LandingPage.event_strips_for_month(@shown_month)
  end
  
end
