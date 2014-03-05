class FixCustomerOrderItem < ActiveRecord::Migration
  def change
    change_column :customer_order_items, :print_cost, :decimal, :precision => 10, :scale => 2
  end
end
