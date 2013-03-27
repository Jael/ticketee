class Permissions < ActiveRecord::Migration
  def up
    create_table :permissions do |t|
      t.string :action
      t.integer :thing_id
      t.string :thing_type
      t.integer :user_id

      t.timestamp
    end
  end

  def down
    drop_table :permissions
  end
end
