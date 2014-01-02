class PrintOption < ActiveRecord::Base
  has_many :photo_print_options
  has_many :photos, :through => :photo_print_options


  ### Callbacks
  after_save :assign_to_photos
  
  ### Methods
  def name_with_price
    "#{name} - #{number_to_currency(price)}" 
  end
  
  
  private
    
  def assign_to_photos
    Photo.all.each do |photo|
      photo.photo_print_options.create(print_option_id: self.id)
    end
  end
  
end
