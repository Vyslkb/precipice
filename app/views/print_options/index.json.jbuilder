json.array!(@print_options) do |print_option|
  json.extract! print_option, :id, :name, :size, :price
  json.url print_option_url(print_option, format: :json)
end
