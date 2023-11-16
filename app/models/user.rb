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

  after_create :create_patient

  def full_name
    "#{first_name} #{last_name}"
  end

  def self.ransackable_attributes(_auth_object = nil)
    %w[created_at email encrypted_password first_name id id_value last_name phone_number
       remember_created_at reset_password_sent_at reset_password_token role updated_at]
  end
  
  private

  def create_patient
    Patient.create(user: self)
  end
end
