class AddCodeToOrder < ActiveRecord::Migration
  def change
   
    add_column :customer_orders, :discount_code, :string
  
  end
end
