class AddDiscountCodeToCart < ActiveRecord::Migration
  def change
    add_column :shopping_carts, :discount_code_id, :integer
  end
end
