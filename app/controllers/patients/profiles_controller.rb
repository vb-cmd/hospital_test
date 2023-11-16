module Patients
  class ProfilesController < BaseController
    load_and_authorize_resource class: 'Patient'

    def show
      @patient = Patient.find_by(user: current_user)
    end
  end
end
