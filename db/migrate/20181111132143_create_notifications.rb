class CreateNotifications < ActiveRecord::Migration
  def change
    create_table :notifications do |t|
      t.string :body
      t.string :body_textmsg
      t.string :event
      t.integer :delay
      t.integer :previous
      t.references :center, index: true

      t.timestamps
    end
  end
end
