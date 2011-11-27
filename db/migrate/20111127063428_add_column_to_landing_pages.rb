class AddColumnToLandingPages < ActiveRecord::Migration
  def change
    add_column :landing_pages, :release_date, :date
  end
end
