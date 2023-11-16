require_relative 'base_controller_test'

module Patients
  class DoctorsControllerTest < BaseControllerTest
    setup do
      @category = categories(:one)
    end

    test 'should get index' do
      get patients_doctors_url
      assert_response :success
    end

    test 'filter doctors by category' do
      get patients_doctors_url, params: { category: @category.name }
      assert_response :success
    end
  end
end
