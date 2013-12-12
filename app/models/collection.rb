class Collection < ActiveRecord::Base
  has_many :galleries, :inverse_of => :collection 

end

