require "test_helper"

class Public::ExtraversionsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get public_extraversions_new_url
    assert_response :success
  end
end
