class AddItemDetails < ActiveRecord::Migration
  def change
    add_column :shopping_cart_items, :item_description, :string
  
  end
end
