require 'test_helper'

module Patients
  class BaseControllerTest < ActionDispatch::IntegrationTest
    include Devise::Test::IntegrationHelpers

    setup do
      sign_in users(:three)
    end
  end
end
