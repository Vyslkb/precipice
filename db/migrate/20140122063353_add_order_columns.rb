class AddOrderColumns < ActiveRecord::Migration
  def change
    add_column :photos, :slideshow_order, :integer
    add_column :galleries, :order_in_collection, :integer
    add_column :collections, :display_order, :integer
    
  end
end
