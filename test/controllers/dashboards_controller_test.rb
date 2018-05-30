require 'test_helper'

class DashboardsControllerTest < ActionDispatch::IntegrationTest
  test "should get edit" do
    get dashboards_edit_url
    assert_response :success
  end

  test "should get update" do
    get dashboards_update_url
    assert_response :success
  end

  test "should get destroy" do
    get dashboards_destroy_url
    assert_response :success
  end

  test "should get friend" do
    get dashboards_friend_url
    assert_response :success
  end

end
