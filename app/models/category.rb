class Category < ApplicationRecord
  validates :name, presence: true, uniqueness: true

  has_many :doctors

  def self.ransackable_attributes(_auth_object = nil)
    %w[created_at id id_value name updated_at]
  end

  def self.ransackable_associations(_auth_object = nil)
    %w[doctors]
  end

  def self.take_names
    select(:name).map(&:name)
  end
end
