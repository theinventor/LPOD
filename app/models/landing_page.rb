class LandingPage < ActiveRecord::Base
  belongs_to  :landing_page_type
  belongs_to  :industry
  has_many    :votes 
  
  has_event_calendar :start_at_field  => 'release_date', :end_at_field => 'release_date'   
   
  validates :title,  :presence => true
  validates :url,  :presence => true, :uniqueness => true
  validates :industry_name,  :presence => true
  validates :landing_page_type_name, :presence => true
  # validates :release_date, :presence => true, :uniqueness => true
  
  mount_uploader :screen_shot, ScreenshotUploader
  
  after_create :landing_page_thumbnails, :calendar_dates
  
  scope :default, order("release_date desc")
  
  scope :calendar, where("release_date > ?", Time.now - 30.days).default 

  # default_scope :order => 'created_at DESC' 
 
  def update_score
    vote_counts = Vote.where('landing_page_id = ?', self.id).count
    self.score = vote_counts
    self.save
  end   
  
  def industry_name
    industry.try(:name)
  end
  
  def industry_name=(name)
    name = name.titleize
    self.industry = Industry.find_or_create_by_name(name) if name.present?
  end
  
  def landing_page_type_name
    landing_page_type.try(:name)
  end
  
  def landing_page_type_name=(name)
    self.landing_page_type = LandingPageType.find_or_create_by_name(name) if name.present?
  end
  
  def landing_page_thumbnails
    kit = IMGKit.new("#{self.url}").to_png
    # path = "#{Rails.root}/public/uploads/tmp/#{self.title.downcase.gsub(" ","_")}.png" 
    # path = "#{Rails.root}/tmp/#{self.title.downcase.gsub(" ","_")}.png"
    # file = kit.to_file(path)
    self.screen_shot = kit 
    self.score = 0
    self.save!
  end 
  
  def calendar_dates
    date = self.release_date
  end
  
end
