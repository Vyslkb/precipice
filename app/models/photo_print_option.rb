class PhotoPrintOption < ActiveRecord::Base
  belongs_to :print_option
  belongs_to :photo
  
  validates_uniqueness_of :print_option_id, scope: :photo_id
  validates_presence_of :photo_id, :print_option_id
  
  def print_option_name_and_price
    "#{self.print_option.name} -- $#{self.print_option.price}"
  end
end
