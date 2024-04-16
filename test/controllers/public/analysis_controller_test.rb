require "test_helper"

class Public::AnalysisControllerTest < ActionDispatch::IntegrationTest
  test "should get top" do
    get public_analysis_top_url
    assert_response :success
  end

  test "should get show" do
    get public_analysis_show_url
    assert_response :success
  end
end
