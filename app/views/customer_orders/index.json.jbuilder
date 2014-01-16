json.array!(@customer_orders) do |customer_order|
  json.extract! customer_order, :id, :first_name, :last_name, :email, :phone_number, :ship_to_first_name, :ship_to_last_name, :address_line_1, :address_line_2, :city, :state, :zip_code, :shopping_cart_id, :shopping_cart_total, :comments
  json.url customer_order_url(customer_order, format: :json)
end
