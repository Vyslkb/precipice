class Gallery < ActiveRecord::Base
  belongs_to :collection, :inverse_of => :galleries
  has_many :photos, :inverse_of => :gallery, :dependent => :restrict_with_error
  
  ### Validations
  validates_presence_of :collection_id, :name
  
  
  def name_with_collection
    "#{self.collection.name} - #{name}"
  end
end
