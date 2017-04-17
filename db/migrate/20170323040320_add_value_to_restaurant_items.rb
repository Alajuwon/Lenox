class AddValueToRestaurantItems < ActiveRecord::Migration[5.0]
  def change
    add_column :restaurant_items, :menu_id, :integer
  end
end
