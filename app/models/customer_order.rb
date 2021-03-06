class CustomerOrder < ActiveRecord::Base
  ### Associations
  belongs_to :shopping_cart
  has_many :customer_order_items, inverse_of: :customer_order
  
  ### Validations
  validates_presence_of :first_name, :last_name, :email, :phone_number, :ship_to_first_name,
                        :ship_to_last_name, :address_line_1, :city, :state, :zip_code
                    
  
  validates :first_name, length: { in: 2..50 }
  validates :last_name, length: { in: 2..50 }
  validates :phone_number, length: {is: 10 }
  validates_format_of :email, with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/
  validates :ship_to_first_name, length: { in: 2..50 }
  validates :ship_to_last_name, length: { in: 2..50 }
  
  validates :address_line_1, length: { in: 2..100 }
  validates :city, length: { in: 2..100 }
  validates :zip_code, length: { is: 5 }, numericality: true
  
  ### Callbacks
  before_validation :format_phone_number 
 
  ### Nested attributes
  accepts_nested_attributes_for :customer_order_items, allow_destroy: true
  
  
  
  def format_phone_number
    self.phone_number = self.phone_number.gsub(/\D/, '')
  end
  
end
