class AddDiscountToOrder < ActiveRecord::Migration
  def change
    add_column :customer_orders, :discount_percentage, :integer
  end
end
