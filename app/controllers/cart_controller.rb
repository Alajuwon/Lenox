class CartController < ApplicationController
  
  def add_to_order

    if params[:quantity].to_i <= RestaurantItem.find(params[:restaurant_item_id]).quantity
      @order = current_order

      line_item = @order.line_items.new(restaurant_item_id: params[:restaurant_item_id], quantity: params[:quantity])
      @order.save

      session[:order_id] = @order.id

      line_item.update(line_item_total: (line_item.restaurant_items.price * line_item.quantity))

      redirect_to :back

    else
      redirect_to RestaurantItem.find(params[:restaurant_item_id]) , notice: "Sorry, not enough restaurant items in stock."
    end
  end

  def view_order
    @line_items = current_order.line_items
    @sum = 0
    @line_items.pluck(:line_item_total).each do |num|
      @sum += num
    end
  end

  def place_order
    line_items = current_order.line_items

    if line_items.length != 0
      current_order.update(guest_id: current_guest.id, subtotal: 0)
      @order = current_order

      line_items.each do |line_item|
        line_item.restaurant_item.update(quantity: (line_item.restaurant_item.quantity - line_item.quantity))
        @order.order_items[line_item.restaurant_item_id] = line_item.quantity 
        @order.subtotal += line_item.line_item_total
      end

      @order.save

      @order.update(sales_tax: (@order.subtotal * 0.08))
      @order.update(grand_total: (@order.sales_tax + @order.subtotal))
    
      @order.line_items.destroy_all 

      session[:order_id] = nil

      else
      redirect_to :back , notice: "No items placed to order!"
    end
  end

  def order_complete
    @order = Order.find(params[:order_id])
    @amount = (@order.grand_total.to_f.round(2) * 100).to_i

    guest = Stripe::Guest.create(
      :email => current_guest.email,
      :card => params[:stripeToken]
    )

    charge = Stripe::Charge.create(
      :guest => guest.id,
      :amount => @amount,
      :description => 'Rails Stripe customer',
      :currency => 'usd'
    )

    rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to cart_path
  end
end
