require "test_helper"

class PagesControllerTest < ActionDispatch::IntegrationTest
  test "should get privacy_policy" do
    get pages_privacy_policy_url
    assert_response :success
  end
end
