require "test_helper"

class UserEndorsementsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get user_endorsements_new_url
    assert_response :success
  end

  test "should get create" do
    get user_endorsements_create_url
    assert_response :success
  end
end
