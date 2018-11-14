json.array!(@blocks) do |block|
  json.extract! block, :id, :duration, :zone
  json.url block_url(block, format: :json)
end
