json.array!(@site_photos) do |site_photo|
  json.extract! site_photo, :id, :name
  json.url site_photo_url(site_photo, format: :json)
end
