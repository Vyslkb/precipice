class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.string :name
      t.text :description
      t.boolean :active
      t.string :paypal_identifier

      t.timestamps
    end
  end
end
