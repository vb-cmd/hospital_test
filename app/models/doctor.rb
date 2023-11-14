class Doctor < ApplicationRecord
    belongs_to :user
    
    has_many :doctor_patients
    has_many :doctor_categories
    has_many :patients, through: :doctor_patients
    has_many :categories, through: :doctor_categories
end
