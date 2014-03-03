class PrintOption < ActiveRecord::Base
  has_many :photo_print_options, :dependent => :destroy
  has_many :photos, :through => :photo_print_options
  
  belongs_to :print_type, :inverse_of => :print_options

  default_scope {order(:display_order)}
  
  cattr_accessor :add_to_photos

  ### Callbacks
  before_create :set_order
  after_save :assign_to_photos
  
  
  ### Methods
  def name_with_price
    "#{name} - #{number_to_currency(price)}" 
  end
  
  
  private
  def set_order
    self.display_order = PrintOption.count
  end
    
  def assign_to_photos
    if self.add_to_photos.to_i == 1
      Photo.all.each do |photo|
        photo.photo_print_options.create(print_option_id: self.id)
      end
    end
  end
  
  
end
