Rails.application.routes.draw do
	
  post 'add_to_order' => 'cart#add_to_order'

  get 'view_order' => 'cart#view_order'

  get 'place_order' => 'cart#place_order'

  post 'order_complete' => 'cart#order_complete'

  root 'lenox#grand_entrance'

  get 'all_restaurant_items' => 'mainfront#all_restaurant_items'

  get 'menu_items' => 'mainfront#items_by_menu'

  get 'calorie_range' => 'mainfront#items_by_calories'

  get 'price_range' => 'mainfront#items_by_price'

  resources :restaurant_items

  get 'about' => 'lenox#about'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
