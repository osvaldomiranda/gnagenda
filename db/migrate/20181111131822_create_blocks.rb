class CreateBlocks < ActiveRecord::Migration
  def change
    create_table :blocks do |t|
      t.integer :duration
      t.string :zone

      t.timestamps
    end
  end
end
