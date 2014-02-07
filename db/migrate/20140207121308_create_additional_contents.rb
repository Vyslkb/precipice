class CreateAdditionalContents < ActiveRecord::Migration
  def change
    create_table :additional_contents do |t|
      t.text :philosophy
      t.text :contact
      t.text :prints_and_pricing

      t.timestamps
    end
  end
end
