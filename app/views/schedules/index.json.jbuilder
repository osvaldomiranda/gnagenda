json.array!(@schedules) do |schedule|
  json.extract! schedule, :id, :id_centro, :rol, :reservation_id, :status, :creation_time, :quantity, :start_time, :end_time, :user_notes, :custom_color, :night_reservation, :currency, :first_name, :last_name, :login, :user_id, :email, :mobile_number, :mobile_country_code, :phone, :phone_country_code, :zip, :country, :address, :state, :city, :resource_id, :name
  json.url schedule_url(schedule, format: :json)
end
