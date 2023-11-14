class DoctorPatient < ApplicationRecord
  validates :recommendation, presence: true
  validates :closed, inclusion: { in: [true, false] }
  
  belongs_to :doctor
  belongs_to :patient
end
