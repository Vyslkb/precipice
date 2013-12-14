class Collection < ActiveRecord::Base
  has_many :galleries, :inverse_of => :collection, :dependent => :restrict_with_error
  
  validates_presence_of :name 

  ### Nested attributes
  accepts_nested_attributes_for :galleries, reject_if: proc { |attributes| attributes['name'].blank? }
  
end

