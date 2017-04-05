class CreateJumps < ActiveRecord::Migration
  def change
    create_table :jumps do |t|
      t.integer :user_id
      t.integer :location_id
      t.string :kind
      t.string :height
      t.string :comments
    end
  end
end
