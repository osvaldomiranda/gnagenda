class CreateClients < ActiveRecord::Migration
  def change
    create_table :clients do |t|
      t.string :rut
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :celphone
      t.integer :age
      t.string :gender
      t.string :citizenship
      t.string :origin
      t.string :state

      t.timestamps
    end
  end
end
