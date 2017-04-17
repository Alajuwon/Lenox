json.extract! restaurant_item, :id, :name, :price, :quantity, :description, :rating, :category_id, :calories, :created_at, :updated_at
json.url restaurant_item_url(restaurant_item, format: :json)
