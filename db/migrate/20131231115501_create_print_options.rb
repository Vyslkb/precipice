class CreatePrintOptions < ActiveRecord::Migration
  def change
    create_table :print_options do |t|
      t.string :name
      t.string :size
      t.integer :price

      t.timestamps
    end
  end
end
