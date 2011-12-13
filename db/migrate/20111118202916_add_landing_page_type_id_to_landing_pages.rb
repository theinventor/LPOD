class AddLandingPageTypeIdToLandingPages < ActiveRecord::Migration
  def change
    add_column :landing_pages, :landing_page_type_id, :integer
    add_column :landing_pages, :industry_id, :integer
  end
end
