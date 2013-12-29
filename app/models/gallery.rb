class Gallery < ActiveRecord::Base
  ### Associations
  belongs_to :collection, :inverse_of => :galleries
  has_many :photos, :inverse_of => :gallery, :dependent => :restrict_with_error
  
  ### Validations
  validates_presence_of :collection_id, :name
  
  ### Callbacks
  after_save :reorder_photos
   
  ### Nested attributes
  accepts_nested_attributes_for :photos #, reject_if: proc { |attributes| attributes['photo_file'].blank? }
  
  
  
  
  def name_with_collection
    "#{self.collection.name} - #{name}"
  end
  
  private
 
    def reorder_photos
      if self.photos.present?
        # Need to figure out if most recently updated photo is moving
        # up or moving down
        previous_position_array = Array(1..self.photos.count) - self.photos.map{|p| p.gallery_order}
        previous_position = previous_position_array[0].to_i 
          
        new_position = self.photos.order("updated_at desc").first.gallery_order.to_i  
                
        if previous_position > new_position
          sort_order = "desc"
        else
          sort_order = "asc"
        end

        self.photos.order("gallery_order asc, updated_at #{sort_order}").each_with_index do |photo, i|
          base1_index = i + 1
          if photo.gallery_order != base1_index 
            photo.update_attribute :gallery_order, base1_index
          end
        end
      end
    end
end
