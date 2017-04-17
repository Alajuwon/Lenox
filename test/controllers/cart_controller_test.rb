require 'test_helper'

class CartControllerTest < ActionDispatch::IntegrationTest
  test "should get add_to_order" do
    get cart_add_to_order_url
    assert_response :success
  end

  test "should get view_order" do
    get cart_view_order_url
    assert_response :success
  end

  test "should get place_order" do
    get cart_place_order_url
    assert_response :success
  end

end
