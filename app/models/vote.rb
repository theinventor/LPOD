class Vote < ActiveRecord::Base 
  belongs_to :landing_page
  
  validates_uniqueness_of :ip, :scope => :landing_page_id 

  after_create :update_score
  
  def update_score
    @landing_page = LandingPage.find(self.landing_page_id)
    @landing_page.update_score
    # update = LandingPage.update_score(self.landing_page_id) 
  end
end
