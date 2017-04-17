require 'test_helper'

class RestaurantItemsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @restaurant_item = restaurant_items(:one)
  end

  test "should get index" do
    get restaurant_items_url
    assert_response :success
  end

  test "should get new" do
    get new_restaurant_item_url
    assert_response :success
  end

  test "should create restaurant_item" do
    assert_difference('RestaurantItem.count') do
      post restaurant_items_url, params: { restaurant_item: { calories: @restaurant_item.calories, category_id: @restaurant_item.category_id, description: @restaurant_item.description, name: @restaurant_item.name, price: @restaurant_item.price, quantity: @restaurant_item.quantity, rating: @restaurant_item.rating } }
    end

    assert_redirected_to restaurant_item_url(RestaurantItem.last)
  end

  test "should show restaurant_item" do
    get restaurant_item_url(@restaurant_item)
    assert_response :success
  end

  test "should get edit" do
    get edit_restaurant_item_url(@restaurant_item)
    assert_response :success
  end

  test "should update restaurant_item" do
    patch restaurant_item_url(@restaurant_item), params: { restaurant_item: { calories: @restaurant_item.calories, category_id: @restaurant_item.category_id, description: @restaurant_item.description, name: @restaurant_item.name, price: @restaurant_item.price, quantity: @restaurant_item.quantity, rating: @restaurant_item.rating } }
    assert_redirected_to restaurant_item_url(@restaurant_item)
  end

  test "should destroy restaurant_item" do
    assert_difference('RestaurantItem.count', -1) do
      delete restaurant_item_url(@restaurant_item)
    end

    assert_redirected_to restaurant_items_url
  end
end
