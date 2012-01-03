class AddKeywordToLandingPages < ActiveRecord::Migration
  def change
    add_column :landing_pages, :keyword, :string
    add_column :landing_pages, :keyword_cpc, :string
  end
end
