module Patients
  class ProfilesController < BaseController
    before_action :authenticate_user!

    def show
      @patient = Patient.find_by(user: current_user)
    end
  end
end
