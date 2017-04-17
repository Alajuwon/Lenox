class AddValueToLineItem < ActiveRecord::Migration[5.0]
  def change
    add_column :line_items, :restaurant_item_id, :integer
  end
end
