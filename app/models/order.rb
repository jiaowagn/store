class Order < ApplicationRecord
  belongs_to :user
  has_many :product_lists 

  validates_presence_of :billing_name, :billing_address, :shipping_name, :shipping_address
end
