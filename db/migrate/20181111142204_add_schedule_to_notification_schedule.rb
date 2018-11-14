class AddScheduleToNotificationSchedule < ActiveRecord::Migration
  def change
    add_reference :notification_schedules, :schedule, index: true
  end
end
