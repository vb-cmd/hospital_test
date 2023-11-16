require_relative 'base_controller_test'

module Patients
  class RecommendationsControllerTest < BaseControllerTest
    setup do
      @doctor = doctors(:two)
    end

    test 'should get index' do
      get patients_recommendations_url
      assert_response :success
    end

    test 'should create recommendation' do
      post patients_recommendations_url, params: { doctor_id: @doctor.id }
      assert_redirected_to patients_doctors_url
    end
  end
end
