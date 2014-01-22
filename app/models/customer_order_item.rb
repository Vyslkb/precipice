class CustomerOrderItem < ActiveRecord::Base
  belongs_to :customer_order, inverse_of: :customer_order_items
  belongs_to :photo
end
