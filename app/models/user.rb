class User < ApplicationRecord
  validates :phone_number, presence: true, uniqueness: true
  validates :first_name, :last_name, presence: true

  enum role: %i[patient doctor]

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable,
         :registerable,
         :recoverable,
         :rememberable,
         :validatable
end
