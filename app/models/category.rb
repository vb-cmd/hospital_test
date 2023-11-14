class Category < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  
  has_many :doctor_categories
  has_many :doctors, through: :doctor_categories
end
