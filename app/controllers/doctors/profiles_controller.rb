module Doctors
  class ProfilesController < BaseController
    load_and_authorize_resource class: 'Doctor'

    def show
      @doctor = Doctor.find_by(user: current_user)
    end
  end
end
