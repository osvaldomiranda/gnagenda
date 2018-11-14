class Client < ActiveRecord::Base
  has_many :schedules
  # has_many :notification_schedules
end
