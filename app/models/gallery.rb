class Gallery < ActiveRecord::Base
  ### Associations
  belongs_to :collection, :inverse_of => :galleries
  has_many :photos, :inverse_of => :gallery, :dependent => :restrict_with_error
  
  ### Validations
  validates_presence_of :collection_id, :name
  
  
  ### Nested attributes
  accepts_nested_attributes_for :photos, reject_if: proc { |attributes| attributes['photo_file'].blank? }
  
  
  def name_with_collection
    "#{self.collection.name} - #{name}"
  end
end
