class AdminUser < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable,
         :recoverable,
         :rememberable,
         :validatable,
         :trackable,
         authentication_keys: [:email]

  def self.ransackable_attributes(_auth_object = nil)
    %w[created_at current_sign_in_at current_sign_in_ip email id id_value
       last_sign_in_at last_sign_in_ip remember_created_at reset_password_sent_at
       reset_password_token sign_in_count updated_at]
  end
end
