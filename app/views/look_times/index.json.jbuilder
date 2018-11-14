json.array!(@look_times) do |look_time|
  json.extract! look_time, :id, :hour, :day, :from, :to, :center_id, :resource_id
  json.url look_time_url(look_time, format: :json)
end
