require "test_helper"

class HappeningsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get happenings_index_url
    assert_response :success
  end
end
