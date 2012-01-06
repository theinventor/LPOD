class ApplicationController < ActionController::Base
  protect_from_forgery 
  
  def sidebar(industry, lpt)
    @industries = Industry.joins(:landing_pages).select('distinct industries.*').limit(10) if industry.nil? 
    @lpt = LandingPageType.joins(:landing_pages).select('distinct landing_page_types.*').limit(10) if lpt.nil?
  end
  
end
