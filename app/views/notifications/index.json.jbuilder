json.array!(@notifications) do |notification|
  json.extract! notification, :id, :body, :body_textmsg, :event, :delay, :previous, :center_id
  json.url notification_url(notification, format: :json)
end
