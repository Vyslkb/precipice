class AddGalleryOrderToPhotos < ActiveRecord::Migration
  def change
    add_column :photos, :gallery_order, :integer
  end
end
