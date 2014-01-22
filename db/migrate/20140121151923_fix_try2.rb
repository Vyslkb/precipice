class FixTry2 < ActiveRecord::Migration
  def change
    remove_column :customer_order_items, :print_cost
    add_column :customer_order_items, :print_cost,:integer
  end
end
