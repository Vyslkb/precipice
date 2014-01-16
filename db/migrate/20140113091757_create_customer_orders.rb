class CreateCustomerOrders < ActiveRecord::Migration
  def change
    create_table :customer_orders do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :phone_number
      t.string :ship_to_first_name
      t.string :ship_to_last_name
      t.string :adddress_line_1
      t.string :address_line_2
      t.string :city
      t.string :state
      t.string :zip_code
      t.integer :shopping_cart_id
      t.decimal :shopping_cart_total
      t.text :comments

      t.timestamps
    end
  end
end
