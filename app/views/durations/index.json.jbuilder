json.array!(@durations) do |duration|
  json.extract! duration, :id, :name, :duration, :service_id
  json.url duration_url(duration, format: :json)
end
