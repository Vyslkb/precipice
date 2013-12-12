class Collection < ActiveRecord::Base
  has_many :galleries, :inverse_of => :collection, :dependent => :restrict_with_error
  
  validates_presence_of :name 

end

