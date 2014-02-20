class DiscountCode < ActiveRecord::Base
  validates_presence_of :name, :discount_percentage
  
  validates_numericality_of :discount_percentage, :greater_than => 0, :less_than => 100, :only_integer => true

  before_save :downcase_name
  
  def downcase_name
    self.name = self.name.downcase
  end

end
