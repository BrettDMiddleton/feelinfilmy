require 'test_helper'

class HomesControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get homes_show_url
    assert_response :success
  end

  test "should get index" do
    get homes_index_url
    assert_response :success
  end

  test "should get update_tag" do
    get homes_update_tag_url
    assert_response :success
  end

  test "should get update_watchlist" do
    get homes_update_watchlist_url
    assert_response :success
  end

end
