class Category < ApplicationRecord
  validates :name, presence: true, uniqueness: true

  has_many :doctor_categories
  has_many :doctors, through: :doctor_categories

  def self.ransackable_attributes(_auth_object = nil)
    %w[created_at id id_value name updated_at]
  end

  def self.ransackable_associations(_auth_object = nil)
    %w[doctor_categories doctors]
  end
end
