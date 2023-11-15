require "test_helper"

class Patients::ProfilesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get patient_profile_index_url
    assert_response :success
  end
end
