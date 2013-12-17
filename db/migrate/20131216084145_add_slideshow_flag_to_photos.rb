class AddSlideshowFlagToPhotos < ActiveRecord::Migration
  def change
    add_column :photos, :slideshow_flag, :boolean
  end
end
