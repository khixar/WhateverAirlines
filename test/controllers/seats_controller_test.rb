require 'test_helper'

class SeatsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get seats_index_url
    assert_response :success
  end

  test "should get new" do
    get seats_new_url
    assert_response :success
  end

  test "should get edit" do
    get seats_edit_url
    assert_response :success
  end

  test "should get delete" do
    get seats_delete_url
    assert_response :success
  end

end
