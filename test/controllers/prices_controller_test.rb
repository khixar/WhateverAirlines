require 'test_helper'

class PricesControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get prices_show_url
    assert_response :success
  end

  test "should get update" do
    get prices_update_url
    assert_response :success
  end

end
