class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.integer :value
      t.integer :landing_page_id
      t.string :ip

      t.timestamps
    end
  end
end
