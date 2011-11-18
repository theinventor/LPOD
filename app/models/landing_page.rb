class LandingPage < ActiveRecord::Base
  belongs_to :landing_page_type
  belongs_to :industry
  mount_uploader :screen_shot, ScreenshotUploader
end
