class CreatePrintTypes < ActiveRecord::Migration
  def change
    create_table :print_types do |t|
      t.string :name
      t.integer :display_order

      t.timestamps
    end
  end
end
