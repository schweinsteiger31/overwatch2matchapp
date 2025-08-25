require "test_helper"

class PlayModelsControllerTest < ActionDispatch::IntegrationTest
  test "should get edit" do
    get play_models_edit_url
    assert_response :success
  end
end
