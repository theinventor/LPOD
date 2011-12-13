class ApplicationController < ActionController::Base
  protect_from_forgery 
  
  def sidebar
    @industries = Industry.joins(:landing_pages).select('distinct industries.*').limit(10) 
    @lpt = LandingPageType.joins(:landing_pages).select('distinct landing_page_types.*').limit(10)
  end
  
end
