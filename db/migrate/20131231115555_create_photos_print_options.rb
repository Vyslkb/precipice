class CreatePhotosPrintOptions < ActiveRecord::Migration
  def change
    create_table :photos_print_options do |t|
      t.integer :photo_id
      t.integer :print_option_id

      t.timestamps
    end
  end
end
