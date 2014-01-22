class CreateCustomerOrderItems < ActiveRecord::Migration
  def change
    create_table :customer_order_items do |t|
      t.integer :customer_order_id
      t.string :photo_name
      t.integer :photo_id
      t.string :print_name
      t.string :print_cost
      t.string :integer

      t.timestamps
    end
  end
end
