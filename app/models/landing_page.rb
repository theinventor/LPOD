class LandingPage < ActiveRecord::Base
  belongs_to :landing_page_type
  belongs_to :industry     
   
  validates :title,  :presence => true
  validates :url,  :presence => true, :uniqueness => true
  validates :industry_name,  :presence => true
  validates :landing_page_type_name, :presence => true
  validates :release_date, :presence => true, :uniqueness => true
  
  mount_uploader :screen_shot, ScreenshotUploader
  
  default_scope :order => 'created_at DESC'   
  
  def industry_name
    industry.try(:name)
  end
  
  def industry_name=(name)
    self.industry = Industry.find_or_create_by_name(name) if name.present?
  end
  
  def landing_page_type_name
    landing_page_type.try(:name)
  end
  
  def landing_page_type_name=(name)
    self.landing_page_type = LandingPageType.find_or_create_by_name(name) if name.present?
  end
end
