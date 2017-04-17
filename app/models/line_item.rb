class LineItem < ApplicationRecord

	belongs_to :restaurant_items
	belongs_to :order
	

end
