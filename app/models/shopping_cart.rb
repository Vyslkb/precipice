class ShoppingCart < ActiveRecord::Base
  acts_as_shopping_cart
  
  def shipping_cost
    5 # defines a flat $5 rate
  end
  
  def tax_pct
    0
  end
end
