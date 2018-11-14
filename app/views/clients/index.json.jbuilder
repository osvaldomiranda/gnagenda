json.array!(@clients) do |client|
  json.extract! client, :id, :rut, :first_name, :last_name, :email, :celphone, :age, :gender, :citizenship, :origin, :state
  json.url client_url(client, format: :json)
end
