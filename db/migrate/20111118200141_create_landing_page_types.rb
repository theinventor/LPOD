class CreateLandingPageTypes < ActiveRecord::Migration
  def change
    create_table :landing_page_types do |t|
      t.string :name

      t.timestamps
    end
  end
end
