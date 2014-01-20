class ShoppingCartItem < ActiveRecord::Base
   acts_as_shopping_cart_item
   default_scope { order('created_at DESC') }
end
