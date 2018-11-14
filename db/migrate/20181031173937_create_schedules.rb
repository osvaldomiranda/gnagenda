class CreateSchedules < ActiveRecord::Migration
  def change
    create_table :schedules do |t|
      t.integer :id_centro
      t.string :rol
      t.integer :reservation_id
      t.string :status
      t.datetime :creation_time
      t.integer :quantity
      t.datetime :start_time
      t.datetime :end_time
      t.string :user_notes
      t.string :custom_color
      t.string :night_reservation
      t.string :currency
      t.string :first_name
      t.string :last_name
      t.string :login
      t.string :user_id
      t.string :email
      t.string :mobile_number
      t.string :mobile_country_code
      t.string :phone
      t.string :phone_country_code
      t.string :zip
      t.string :country
      t.string :address
      t.string :state
      t.string :city
      t.string :resource_id
      t.string :name

      t.timestamps
    end
  end
end
