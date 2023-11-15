require "test_helper"

class Doctors::ProfilesControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get doctors_profiles_show_url
    assert_response :success
  end
end
