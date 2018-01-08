require 'test_helper'

class AirlineAdminControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get airline_admin_index_url
    assert_response :success
  end

  test "should get create" do
    get airline_admin_create_url
    assert_response :success
  end

  test "should get update" do
    get airline_admin_update_url
    assert_response :success
  end

end
