class CreateDiscountCodes < ActiveRecord::Migration
  def change
    
    
    create_table :discount_codes do |t|
      t.string :name
      t.integer :discount_percentage

      t.timestamps
    end
  end
end
