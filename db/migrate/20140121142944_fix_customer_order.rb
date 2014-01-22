class FixCustomerOrder < ActiveRecord::Migration
  def change
    remove_column :customer_orders, :shopping_cart_id
    remove_column :customer_orders, :shopping_cart_total
    
    add_column :customer_orders, :total, :decimal, :precision => 8, :scale => 2
    add_column :customer_orders, :subtotal, :decimal, :precision => 8, :scale => 2
    add_column :customer_orders, :shipping, :decimal, :precision => 8, :scale => 2
  end
end
