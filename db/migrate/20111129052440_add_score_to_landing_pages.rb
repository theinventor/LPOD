class AddScoreToLandingPages < ActiveRecord::Migration
  def change
    add_column :landing_pages, :score, :integer
  end
end
