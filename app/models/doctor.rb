class Doctor < ApplicationRecord
  belongs_to :user
  belongs_to :category, counter_cache: true

  has_many :doctor_patients
  has_many :patients, through: :doctor_patients

  validates_with UserExistsValidator, on: :create

  extend SelectData

  # Find doctors by category or return all
  def self.find_by_category_or_all(name = nil)
    if name.blank?
      all
    else
      includes(:category).where(category: { name: })
    end
  end

  def self.ransackable_attributes(_auth_object = nil)
    %w[created_at id updated_at user_id category_id]
  end

  def self.ransackable_associations(_auth_object = nil)
    %w[category doctor_patients patients user]
  end
end
