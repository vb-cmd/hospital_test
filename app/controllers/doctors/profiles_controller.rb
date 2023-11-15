module Doctors
  class ProfilesController < BaseController
    def show
      @doctor = Doctor.find_by(user: current_user)
    end
  end
end
