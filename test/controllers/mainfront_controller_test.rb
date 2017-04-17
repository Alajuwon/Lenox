require 'test_helper'

class MainfrontControllerTest < ActionDispatch::IntegrationTest
  test "should get all_restaurant_items" do
    get mainfront_all_restaurant_items_url
    assert_response :success
  end

  test "should get items_by_menu" do
    get mainfront_items_by_menu_url
    assert_response :success
  end

  test "should get items_by_calories" do
    get mainfront_items_by_calories_url
    assert_response :success
  end

  test "should get items_by_price" do
    get mainfront_items_by_price_url
    assert_response :success
  end

end
