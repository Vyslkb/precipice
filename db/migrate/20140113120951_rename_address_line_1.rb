class RenameAddressLine1 < ActiveRecord::Migration
  def change
    rename_column :customer_orders, :adddress_line_1, :address_line_1
  end
end
