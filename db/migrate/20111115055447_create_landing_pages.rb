class CreateLandingPages < ActiveRecord::Migration
  def change
    create_table :landing_pages do |t|
      t.string :url
      t.text :content

      t.timestamps
    end
  end
end
