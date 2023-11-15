require "test_helper"

class Patient::RecommendationsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get patient_recommendations_index_url
    assert_response :success
  end
end
