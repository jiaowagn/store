class Order < ApplicationRecord
  belongs_to :user
  
  validates_presence_of :billing_name, :billing_address, :shipping_name, :shipping_address
end
