class Gallery < ActiveRecord::Base
  belongs_to :collection, :inverse_of => :galleries
  has_many :photos, :inverse_of => :gallery
  
  def name_with_collection
    "#{self.collection.name} - #{name}"
  end
end
