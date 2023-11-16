class MaxPatientsValidator < ActiveModel::Validator
  MAX_PATIENTS = 10

  def validate(record)
    return unless record.doctor.doctor_patients.where(closed: false).count >= MAX_PATIENTS

    record.errors.add(:base,
                      'Max patients reached')
  end
end
