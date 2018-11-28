class CreateDurations < ActiveRecord::Migration
  def change
    create_table :durations do |t|
      t.string :name
      t.integer :duration
      t.references :service, index: true

      t.timestamps
    end
  end
end
