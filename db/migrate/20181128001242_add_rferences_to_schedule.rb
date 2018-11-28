class AddRferencesToSchedule < ActiveRecord::Migration
  def change
    add_reference :schedules, :service, index: true
    add_reference :schedules, :duration, index: true
  end
end
