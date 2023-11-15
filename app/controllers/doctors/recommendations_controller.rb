module Doctors
  class RecommendationsController < BaseController
    before_action :set_doctor
    before_action :set_doctor_patient, only: %i[edit update]

    def index
      @doctor_patients = @doctor.doctor_patients.includes(:patient)
    end

    def edit; end

    def update
      if @doctor_patient.update(recommendation_params)
        redirect_to doctors_recommendations_path, notice: 'Recommendation was successfully updated.'
      else
        redirect_to edit_doctors_recommendation_path(@doctor_patient), alert: 'Recommendation was not updated.'
      end
    end

    private

    def set_doctor_patient
      @doctor_patient = DoctorPatient.find(params[:id])
    end

    def set_doctor
      @doctor = Doctor.find_by(user: current_user)
    end

    def recommendation_params
      params.require(:doctor_patient).permit(:recommendation).merge(closed: true)
    end
  end
end
