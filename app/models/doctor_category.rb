class DoctorCategory < ApplicationRecord
  belongs_to :doctor
  belongs_to :category

  validate :doctor_has_category

  def self.ransackable_attributes(_auth_object = nil)
    %w[category_id created_at doctor_id id id_value updated_at]
  end

  private

  def doctor_has_category
    errors.add(:doctor, "already has this category '#{category.name}'") if doctor.categories.include?(category)
  end
end
