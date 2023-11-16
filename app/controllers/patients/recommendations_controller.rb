module Patients
  class RecommendationsController < BaseController
    authorize_resource class: false

    before_action :set_patient
    before_action :initialize_doctor_patient, only: %i[create]

    def index
      @doctor_patients = @patient.doctor_patients
                                 .includes(:doctor)
                                 .order(created_at: :desc)
    end

    def create
      if @doctor_patient.save
        redirect_to patients_doctors_path, notice: t('.success')
      else
        redirect_to patients_doctors_path, alert: t('.error')
      end
    end

    private

    def set_patient
      @patient = Patient.find_by(user: current_user)
    end

    def initialize_doctor_patient
      @doctor = Doctor.find(params[:doctor_id])

      @doctor_patient = DoctorPatient.new(
        patient: @patient,
        doctor: @doctor
      )
    end
  end
end
