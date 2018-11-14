class NotificationSchedule < ActiveRecord::Base
  belongs_to :notification
  belongs_to :schedule
end
