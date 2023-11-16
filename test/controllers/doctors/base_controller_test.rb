require 'test_helper'

module Doctors
  class BaseControllerTest < ActionDispatch::IntegrationTest
    include Devise::Test::IntegrationHelpers

    setup do
      sign_in users(:one)
    end
  end
end
