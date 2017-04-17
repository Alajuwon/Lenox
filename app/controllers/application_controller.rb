class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :menu, :calories, :price
  helper_method :current_order


  def menu
  	@menus = Menu.all
  end

  def calories
  	@calories = RestaurantItem.pluck(:calories).uniq
  end

  def price
  	@price = RestaurantItem.pluck(:price).sort
  end

  def current_order
    if !session[:order_id].nil?
      Order.find(session[:order_id])
    else 
      Order.new
    end
  end
end

                                  
                              						  
