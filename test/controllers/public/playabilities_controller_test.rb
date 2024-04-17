require "test_helper"

class Public::PlayabilitiesControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get public_playabilities_new_url
    assert_response :success
  end
end
