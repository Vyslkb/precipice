class Photo < ActiveRecord::Base
   extend FriendlyId
   friendly_id :name, use: :slugged
   
   ### Custom Attributes
   has_attached_file :photo_file, :styles => { :medium => "300x300>", 
                                               :thumb => "100x100>", 
                                               :large => "1100x1100>",
                                               :original => "1400x1400>" },
                                               :convert_options => {:thumb => "-quality 60 -strip",
                                                                    :medium => "-quality 60 -strip",
                                                                    :large => "-quality 60 -strip",
                                                                    :original => "-quality 75" }, 
                                               :default_url => "/images/:style/missing.png"
   
  validates_attachment_content_type :photo_file, :content_type => %w(image/jpeg image/jpg image/png)
  
  ### Associations
  belongs_to :gallery, :inverse_of => :photos
   
  has_many :photo_print_options
  has_many :print_options, :through => :photo_print_options
   
  ### Validations
  validates_presence_of :name, :photo_file
  validates :name, uniqueness: { case_sensitive: false }
    
  ### Callbacks
  before_create :set_gallery_order
  before_save :nullify_gallery_id
  after_save :add_print_options
  
  
  ### Nested Attributes
  accepts_nested_attributes_for :photo_print_options, allow_destroy: true
  
  
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
      where(slideshow_flag: true).order('slideshow_order')
    end
    
    
   ### Methods
   def collection_gallery_name
     self.try(:gallery).try(:name_with_collection)
   end
   
   def nullify_gallery_id
     self.gallery_id = nil if self.gallery_id == 0
   end
   
   def set_gallery_order
     if self.gallery_id.present?
       if self.gallery_order.blank?
         self.gallery_order = self.gallery.photos.count + 1
       end
     end
   end
   
  def next_photo
    next_index = self.gallery_order.to_i + 1
    if Photo.where(gallery_id: self.gallery_id, gallery_order: next_index).exists?
      next_photo = Photo.where(gallery_id: self.gallery_id).find_by_gallery_order(next_index)
    else
      next_photo = Gallery.find(self.gallery_id).photos.use_gallery_order.first # Photo.where(gallery_id: self.gallery_id).find_by_gallery_order(next_index) 
    end
    
    next_photo 
  end
   
   def previous_photo
     #previous_photo = Photo.where(gallery_id: self.gallery_id).find_by_gallery_order(self.gallery_order - 1)
     previous_index = self.gallery_order.to_i - 1
     
     if Photo.where(gallery_id: self.gallery_id, gallery_order: previous_index).exists?
        previous_photo = Photo.where(gallery_id: self.gallery_id).find_by_gallery_order(previous_index)
      else
        previous_photo = Gallery.find(self.gallery_id).photos.use_gallery_order.last
      end
      
      previous_photo
   end
   
   def add_print_options
     PrintOption.all.each do |print_option|
       self.photo_print_options.create(print_option_id: print_option.id)
     end
   end
   
  def should_generate_new_friendly_id?
    name_changed? || slug.nil?
  end
   
end
