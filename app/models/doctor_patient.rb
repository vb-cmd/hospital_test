class DoctorPatient < ApplicationRecord
  validates :closed, inclusion: { in: [true, false] }

  belongs_to :doctor
  belongs_to :patient

  def self.ransackable_attributes(_auth_object = nil)
    %w[closed created_at doctor_id id id_value patient_id recommendation updated_at]
  end
end
