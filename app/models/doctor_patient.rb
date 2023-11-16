class DoctorPatient < ApplicationRecord
  validates :closed, inclusion: { in: [true, false] }

  belongs_to :doctor
  belongs_to :patient

  validates_with MaxPatientsValidator, on: :create

  def self.ransackable_attributes(_auth_object = nil)
    %w[closed created_at doctor_id id id_value patient_id recommendation updated_at]
  end

  def patient_full_name
    patient.user.full_name
  end

  def doctor_full_name
    doctor.user.full_name
  end
end
