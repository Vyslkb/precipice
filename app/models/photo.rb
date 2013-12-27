class Photo < ActiveRecord::Base
   ### Custom Attributes
   has_attached_file :photo_file, :styles => { :medium => "300x300>", 
                                               :thumb => "100x100>", 
                                               :large => "1100x1100>" },
                                               :convert_options => {:thumb => "-quality 60 -strip",
                                                                    :medium => "-quality 60 -strip",
                                                                    :large => "-quality 60 -strip" }, 
                                               :default_url => "/images/:style/missing.png"
   
   ### Associations
   belongs_to :gallery, :inverse_of => :photos
   
   ### Validations
   validates_presence_of :name, :photo_file
   
  ### Callbacks
  before_save :nullify_gallery_id
  
  
  
  ### Scopes
    def self.use_gallery_order
      self.order("gallery_order asc")
    end
    
    def self.order_by_gallery
      self.includes(:gallery => [:collection]).order("galleries.name")
    end
     
    def self.uncategorized
      where(gallery_id: nil)
    end
    
    def self.slideshow
      where(slideshow_flag: true)
    end
    
    
   ### Methods
   def collection_gallery_name
     self.try(:gallery).try(:name_with_collection)
   end
   
   def nullify_gallery_id
     self.gallery_id = nil if self.gallery_id == 0
   end
   
  def next_photo
    next_photo = Photo.where(gallery_id: self.gallery_id).find_by_gallery_order(self.gallery_order + 1) 
  end
   
   def previous_photo
     previous_photo = Photo.where(gallery_id: self.gallery_id).find_by_gallery_order(self.gallery_order - 1)
     #previous_photo = self  if previous_photo.nil?
   end
   
   def set_gallery_order
     if self.gallery_order_changed?
        # If new position is lower than previous:
        # Subtract 1 from gallery order to ensure it falls ahead of the photo it is meant to replace.
        # If new position is higher than previous:  
        # Leave be to ensure it is lower (base1 index will be higher than base 0)
        # Gallery Controller will handle the re-order of the collection
       
       if self.gallery_order_change[1] <= self.gallery_order_change[0]
         self.gallery_order = self.gallery_order_change[1].to_i - 1
       else
         self.gallery_order = self.gallery_order_change[1].to_i + 1
       end
     end
   end
   
   
end
