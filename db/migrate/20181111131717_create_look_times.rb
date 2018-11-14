class CreateLookTimes < ActiveRecord::Migration
  def change
    create_table :look_times do |t|
      t.integer :hour
      t.integer :day
      t.date :from
      t.date :to
      t.references :center, index: true
      t.references :resource, index: true

      t.timestamps
    end
  end
end
