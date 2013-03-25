class CreateTickets < ActiveRecord::Migration
  def up
    create_table :tickets do |t|
      t.string :title
      t.text :description

      t.timestamps
    end
  end

  def down
    drop_table :tickets
  end
end
