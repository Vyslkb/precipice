class AddOrderToPrintOptions < ActiveRecord::Migration
  def change
    add_column :print_options, :display_order, :integer
  end
end
