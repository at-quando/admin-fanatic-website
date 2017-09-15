class OrderItem < ApplicationRecord
	belongs_to :order
  belongs_to :property
  has_one :product, through: :property
end
