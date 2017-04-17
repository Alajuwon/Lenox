class Order < ApplicationRecord

	has_many :line_items
	belongs_to :guest

	serialize :order_items, Hash

end
