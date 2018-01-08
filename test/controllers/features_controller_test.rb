require 'test_helper'

class FeaturesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get features_index_url
    assert_response :success
  end

  test "should get new" do
    get features_new_url
    assert_response :success
  end

  test "should get edit" do
    get features_edit_url
    assert_response :success
  end

  test "should get delete" do
    get features_delete_url
    assert_response :success
  end

end
