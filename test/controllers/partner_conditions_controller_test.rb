require "test_helper"

class PartnerConditionsControllerTest < ActionDispatch::IntegrationTest
  test "should get edit" do
    get partner_conditions_edit_url
    assert_response :success
  end

  test "should get update" do
    get partner_conditions_update_url
    assert_response :success
  end
end
