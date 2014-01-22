class AddQuantityToOrder < ActiveRecord::Migration
  def change
    add_column :customer_order_items, :quantity, :integer
  end
end
