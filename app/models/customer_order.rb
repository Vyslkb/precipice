class CustomerOrder < ActiveRecord::Base
  belongs_to :shopping_cart
end
