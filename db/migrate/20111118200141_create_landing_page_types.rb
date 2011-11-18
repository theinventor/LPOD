class CreateLandingPageTypes < ActiveRecord::Migration
  def change
    create_table :landing_page_types do |t|
      t.string :type

      t.timestamps
    end
  end
end
