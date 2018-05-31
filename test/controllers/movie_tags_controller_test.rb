require 'test_helper'

class MovieTagsControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get movie_tags_create_url
    assert_response :success
  end

end
