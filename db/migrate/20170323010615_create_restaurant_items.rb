class CreateRestaurantItems < ActiveRecord::Migration[5.0]
  def change
    create_table :restaurant_items do |t|
      t.string :name
      t.decimal :price
      t.integer :quantity
      t.text :description
      t.integer :rating
      t.integer :category_id
      t.integer :calories

      t.timestamps
    end
  end
end
