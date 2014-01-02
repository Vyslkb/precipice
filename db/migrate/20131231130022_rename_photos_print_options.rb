class RenamePhotosPrintOptions < ActiveRecord::Migration
  def change
    rename_table :photos_print_options, :photo_print_options
  end
end
