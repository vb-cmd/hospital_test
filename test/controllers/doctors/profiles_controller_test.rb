require_relative 'base_controller_test'

module Doctors
  class ProfilesControllerTest < BaseControllerTest
    test 'should get show' do
      get doctors_profile_url
      assert_response :success
    end
  end
end
