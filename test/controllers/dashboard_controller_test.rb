require 'test_helper'

class DashboardControllerTest < ActionDispatch::IntegrationTest
  test "should get edit" do
    get dashboard_edit_url
    assert_response :success
  end

  test "should get update" do
    get dashboard_update_url
    assert_response :success
  end

  test "should get destroy" do
    get dashboard_destroy_url
    assert_response :success
  end

  test "should get friend" do
    get dashboard_friend_url
    assert_response :success
  end

end
