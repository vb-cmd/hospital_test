require_relative 'base_controller_test'

module Patients
  class ProfilesControllerTest < BaseControllerTest
    test 'should get index' do
      get patients_profile_url
      assert_response :success
    end
  end
end
