class OrderItemsController < ApplicationController
	def index
		binding.pry
		 @orderItems = OrderItem.where(property_id: Property.select(:id).)
	end

	def show
	end
end
