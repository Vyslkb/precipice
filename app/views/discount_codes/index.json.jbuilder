json.array!(@discount_codes) do |discount_code|
  json.extract! discount_code, :id, :name, :discount_percentage
  json.url discount_code_url(discount_code, format: :json)
end
