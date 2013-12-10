json.array!(@photos) do |photo|
  json.extract! photo, :id, :name, :description, :active, :paypal_identifier
  json.url photo_url(photo, format: :json)
end
