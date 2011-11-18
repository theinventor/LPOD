class DropTypeFromLandingPageTypes < ActiveRecord::Migration
  def up
    remove_column :landing_page_types, :type
    add_column :landing_page_types, :types, :sting
  end

  def down
  end
end
