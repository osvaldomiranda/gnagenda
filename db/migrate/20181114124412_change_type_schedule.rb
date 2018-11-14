class ChangeTypeSchedule < ActiveRecord::Migration
  def change
    change_column :schedules, :user_notes, :text
  end
end
