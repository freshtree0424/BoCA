require "test_helper"

class Public::EmotionalitiesControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get public_emotionalities_new_url
    assert_response :success
  end
end
