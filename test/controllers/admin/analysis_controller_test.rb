require "test_helper"

class Admin::AnalysisControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_analysis_index_url
    assert_response :success
  end
end
