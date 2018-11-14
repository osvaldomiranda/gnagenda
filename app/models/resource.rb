class Resource < ActiveRecord::Base
  belongs_to :center
  belongs_to :service
end
