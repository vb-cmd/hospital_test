class Doctor < ApplicationRecord
  belongs_to :user

  has_many :doctor_patients
  has_many :doctor_categories
  has_many :patients, through: :doctor_patients
  has_many :categories, through: :doctor_categories

  # Find doctors by category or return all
  def self.find_by_category_or_all(name = nil)
    if name
      includes(:categories).where(categories: { name: })
    else
      all
    end
  end
end
