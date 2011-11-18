class AddScreenShotToLandingPages < ActiveRecord::Migration
  def change
    add_column :landing_pages, :screen_shot, :string
  end
end
