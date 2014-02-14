class AddAttachmentPhotoFileToSitePhotos < ActiveRecord::Migration
  def self.up
    change_table :site_photos do |t|
      t.attachment :photo_file
    end
  end

  def self.down
    drop_attached_file :site_photos, :photo_file
  end
end
