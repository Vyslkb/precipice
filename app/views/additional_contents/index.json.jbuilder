json.array!(@additional_contents) do |additional_content|
  json.extract! additional_content, :id, :philosophy, :contact, :prints_and_pricing
  json.url additional_content_url(additional_content, format: :json)
end
