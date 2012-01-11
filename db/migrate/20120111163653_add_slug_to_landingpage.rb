class AddSlugToLandingpage < ActiveRecord::Migration
  def change
    add_column :landing_pages, :slug, :string
    add_index :landing_pages, :slug
  end
end
