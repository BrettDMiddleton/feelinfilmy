require 'test_helper'

class HomeControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get home_show_url
    assert_response :success
  end

  test "should get index" do
    get home_index_url
    assert_response :success
  end

  test "should get update_tag" do
    get home_update_tag_url
    assert_response :success
  end

  test "should get update_watchlist" do
    get home_update_watchlist_url
    assert_response :success
  end

end
