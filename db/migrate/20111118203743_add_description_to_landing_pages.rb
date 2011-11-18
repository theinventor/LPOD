class AddDescriptionToLandingPages < ActiveRecord::Migration
  def change
    add_column :landing_pages, :description, :string
  end
end
