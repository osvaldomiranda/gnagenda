class AddServiceToResource < ActiveRecord::Migration
  def change
    add_reference :resources, :service, index: true
  end
end
