class AddImageToRestaurantItems < ActiveRecord::Migration[5.0]
  def change
    add_column :restaurant_items, :image, :string
  end
end
