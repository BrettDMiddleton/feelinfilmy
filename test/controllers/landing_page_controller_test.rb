require 'test_helper'

class LandingPageControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get landing_page_create_url
    assert_response :success
  end

end
