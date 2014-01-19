class AddSlugToGalleriesAndControllers < ActiveRecord::Migration
  def change
    add_column :galleries, :slug, :string
    add_index :galleries, :slug, unique: true
    
    add_column :collections, :slug, :string
    add_index :collections, :slug, unique: true
  end
end
