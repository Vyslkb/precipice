class FixOrderItems < ActiveRecord::Migration
  def change
    remove_column :customer_order_items, :integer
    
  end
end
