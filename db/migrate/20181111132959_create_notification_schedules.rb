class CreateNotificationSchedules < ActiveRecord::Migration
  def change
    create_table :notification_schedules do |t|
      t.string :receiver
      t.string :means
      t.references :notification, index: true

      t.timestamps
    end
  end
end
