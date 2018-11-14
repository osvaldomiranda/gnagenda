class AddColumnsToSchedule < ActiveRecord::Migration
  def change
    add_column :schedules, :nameresource, :string
    add_column :schedules, :fecha, :date
    add_column :schedules, :hora, :string
    add_column :schedules, :duration, :string
    add_column :schedules, :reminder, :string
    add_column :schedules, :age, :string
    add_column :schedules, :gender, :string
    add_column :schedules, :nationality, :string
    add_column :schedules, :origin, :string
    add_column :schedules, :rut, :string
  end
end
