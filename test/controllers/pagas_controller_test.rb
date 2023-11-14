require "test_helper"

class PagasControllerTest < ActionDispatch::IntegrationTest
  test "should get home" do
    get pagas_home_url
    assert_response :success
  end
end
