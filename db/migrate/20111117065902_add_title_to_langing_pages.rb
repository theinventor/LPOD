class AddTitleToLangingPages < ActiveRecord::Migration
  def change
    add_column :landing_pages, :title, :string
  end
end
