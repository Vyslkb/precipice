class ShoppingCart < ActiveRecord::Base
  acts_as_shopping_cart
  belongs_to :discount_code
  
  def shipping_cost
    0 # defines a flat $5 rate
  end
  
  def tax_pct
    0
  end
  
  def apply_discount
    if DiscountCode.where(id: self.discount_code_id).take
      self.shopping_cart_items.each do |item|
        sticker_price = PhotoPrintOption.find(item.item_id).print_option.price
        item.price = (sticker_price * (100 - self.discount_code.discount_percentage) / 100).round(2)
        item.save 
       end
    end
  end
end
