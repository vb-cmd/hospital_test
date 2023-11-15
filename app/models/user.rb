class User < ApplicationRecord
  validates :phone_number, presence: true, uniqueness: true,
                           format: { with: /\A\+.\d+\z/, message: 'only allows digits with +' }
  validates :first_name, :last_name, presence: true

  enum role: %i[patient doctor]

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable,
         :registerable,
         :recoverable,
         :rememberable,
         :validatable

  after_create :create_profile_patient

  private

  def create_profile_patient
    Patient.create(user: self)
  end
end
