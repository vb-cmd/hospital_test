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

  def self.ransackable_attributes(_auth_object = nil)
    %w[created_at id updated_at user_id]
  end

  def self.ransackable_associations(_auth_object = nil)
    %w[categories doctor_categories doctor_patients patients user]
  end

  validate :user_already_exists

  private

  def user_already_exists
    errors.add(:user, 'already exists') if Doctor.exists?(user:)
  end
end
