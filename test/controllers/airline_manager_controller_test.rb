require 'test_helper'

class AirlineManagerControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get airline_manager_index_url
    assert_response :success
  end

  test "should get update" do
    get airline_manager_update_url
    assert_response :success
  end

end
