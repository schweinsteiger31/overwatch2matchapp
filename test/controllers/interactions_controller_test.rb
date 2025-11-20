require "test_helper"

class InteractionsControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get interactions_create_url
    assert_response :success
  end
end
