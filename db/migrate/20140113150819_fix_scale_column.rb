class FixScaleColumn < ActiveRecord::Migration
  def change
    change_column :customer_orders, :shopping_cart_total, :decimal, :precision => 7, :scale => 2
  end
end
