# frozen_string_literal: true

require 'faker'

def create_admins
  puts 'Creating an admin user'

  AdminUser.create!(email: 'admin@example.com',
                    password: 'password',
                    password_confirmation: 'password')
end

def create_users
  puts 'Creating users'
  {
    patient: ['+1234567890', '+1234567891', '+1234567893', '+1234567894', '+1234567895'],
    doctor: ['+2234567890', '+2234567891', '+2234567893', '+2234567894', '+2234567895']
  }.each do |role, phone_numbers|
    phone_numbers.each do |phone_number|
      User.create!(email: Faker::Internet.email,
                   password: 'password',
                   password_confirmation: 'password',
                   phone_number:,
                   role:,
                   first_name: Faker::Name.first_name,
                   last_name: Faker::Name.last_name)
    end
  end
end

def create_doctors_and_patients
  puts 'Creating doctors and patients'

  User.all.each do |user|
    if user.doctor?
      Doctor.create!(user:, category: Category.all.sample)
    elsif user.patient?
      Patient.create!(user:)
    end
  end
end

def create_categories
  puts 'Creating categories'

  %w[Category1 Category2 Category3 Category4 Category5].each do |name|
    Category.create!(name: )
  end
end

def create_recommendations
  puts 'Creating recomendations'

  Doctor.all.each do |doctor|
    DoctorPatient.create!(doctor:, patient: Patient.all.sample)
  end
end

if Rails.env.development?
  create_admins

  create_users

  create_categories

  create_doctors_and_patients

  create_recommendations
end
