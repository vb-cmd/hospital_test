require "test_helper"

class Doctors::RecommendationsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get doctors_recommendations_index_url
    assert_response :success
  end

  test "should get edit" do
    get doctors_recommendations_edit_url
    assert_response :success
  end

  test "should get update" do
    get doctors_recommendations_update_url
    assert_response :success
  end
end
