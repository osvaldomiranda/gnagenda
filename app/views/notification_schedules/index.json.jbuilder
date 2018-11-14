json.array!(@notification_schedules) do |notification_schedule|
  json.extract! notification_schedule, :id, :receiver, :means, :notification_id
  json.url notification_schedule_url(notification_schedule, format: :json)
end
