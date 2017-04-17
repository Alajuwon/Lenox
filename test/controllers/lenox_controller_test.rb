require 'test_helper'

class LenoxControllerTest < ActionDispatch::IntegrationTest
  test "should get grand_entrance" do
    get lenox_grand_entrance_url
    assert_response :success
  end

end
