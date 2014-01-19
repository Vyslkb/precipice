class Collection < ActiveRecord::Base
  extend FriendlyId
  friendly_id :name, use: :slugged
   
  has_many :galleries, :inverse_of => :collection, :dependent => :restrict_with_error
  
  validates_presence_of :name 

  ### Nested attributes
  accepts_nested_attributes_for :galleries, reject_if: proc { |attributes| attributes['name'].blank? }
  
  def should_generate_new_friendly_id?
    name_changed? || slug.nil?
  end
  
end

