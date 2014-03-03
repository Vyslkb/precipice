json.array!(@print_types) do |print_type|
  json.extract! print_type, :id, :name, :display_order
  json.url print_type_url(print_type, format: :json)
end
