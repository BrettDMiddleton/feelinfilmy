require 'test_helper'

class UserMoviesControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get user_movies_create_url
    assert_response :success
  end

  test "should get update" do
    get user_movies_update_url
    assert_response :success
  end

end
