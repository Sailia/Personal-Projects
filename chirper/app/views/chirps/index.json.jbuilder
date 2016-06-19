json.array!(@chirps) do |chirp|
  json.extract! chirp, :id, :author, :message
  json.url chirp_url(chirp, format: :json)
end
