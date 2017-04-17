class MainfrontController < ApplicationController

  
  def all_restaurant_items
  	@restaurant_items = RestaurantItem.all
  end

  def items_by_menu
  	@restaurant_items = RestaurantItem.where(menu: params[:menu_id])
  	@menu = Menu.find(params[:menu_id])
  end

  def items_by_calories
  	@restaurant_items = RestaurantItem.where(calories: params[:calories])
  	@calories = params[:calories]
  end

  def items_by_price
  	@restaurant_items = RestaurantItem.where(price: params[:price])
  	@price = params[:price]
  	
  end

end
