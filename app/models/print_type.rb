class PrintType < ActiveRecord::Base
  has_many :print_options, :inverse_of => :print_type
  has_many :photo_print_options, :through => :print_options
  
  default_scope {order(:display_order)}


  def photo_print_options_for_photo(photo)
    photo_print_options.where(photo_id: photo.id)
  end

end
