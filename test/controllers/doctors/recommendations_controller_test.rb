require_relative 'base_controller_test'

module Doctors
  class RecommendationsControllerTest < BaseControllerTest
    setup do
      @doctor_patients = doctor_patients(:one)
      @category = categories(:one)
    end

    test 'should get index' do
      get doctors_recommendations_url
      assert_response :success
    end

    test 'should get edit' do
      get edit_doctors_recommendation_url(@doctor_patients)
      assert_response :success
    end

    test 'should update recommendation message' do
      put doctors_recommendation_url(@doctor_patients), params: { doctor_patient: { recommendation: 'Message' } }
      assert_redirected_to doctors_recommendations_url
    end
  end
end
