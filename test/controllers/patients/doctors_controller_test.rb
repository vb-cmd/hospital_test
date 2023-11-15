require "test_helper"

class Patients::DoctorsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get patients_doctors_index_url
    assert_response :success
  end
end
