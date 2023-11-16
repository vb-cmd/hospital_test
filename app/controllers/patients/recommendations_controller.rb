module Patients
  class RecommendationsController < BaseController
    authorize_resource class: false

    before_action :set_patient

    def index
      @doctor_patients = @patient.doctor_patients.includes(:doctor).order(closed: :asc)
    end

    def create
      @doctor_patient = initialize_doctor_patient

      if @doctor_patient.save
        redirect_to patients_doctors_path, notice: 'Doctor was successfully added.'
      else
        redirect_to patients_doctors_path, alert: 'Doctor was not added.'
      end
    end

    private

    def set_patient
      @patient = Patient.find_by(user: current_user)
    end

    def initialize_doctor_patient
      @doctor = Doctor.find(params[:doctor_id])

      DoctorPatient.new(
        patient: @patient,
        doctor: @doctor,
        recommendation: 'none'
      )
    end
  end
end
