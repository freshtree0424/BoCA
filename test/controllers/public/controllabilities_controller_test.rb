require "test_helper"

class Public::ControllabilitiesControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get public_controllabilities_new_url
    assert_response :success
  end
end
