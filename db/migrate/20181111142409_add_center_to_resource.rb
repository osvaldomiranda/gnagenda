class AddCenterToResource < ActiveRecord::Migration
  def change
    add_reference :resources, :center, index: true
  end
end
