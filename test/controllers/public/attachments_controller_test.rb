require "test_helper"

class Public::AttachmentsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get public_attachments_new_url
    assert_response :success
  end
end
