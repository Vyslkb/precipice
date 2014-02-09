class AddForSaleFlag < ActiveRecord::Migration
  def change
    add_column :collections, :for_sale_flag, :boolean
  
  end
end
