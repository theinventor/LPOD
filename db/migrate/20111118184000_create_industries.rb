class CreateIndustries < ActiveRecord::Migration
  def change
    create_table :industries do |t|
      t.string :industry

      t.timestamps
    end
  end
end
