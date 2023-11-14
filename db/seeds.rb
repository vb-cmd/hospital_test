# frozen_string_literal: true

require 'faker'

if Rails.env.development?
  puts 'Creating an admin user'

  AdminUser.create!(email: 'admin@example.com',
                    password: 'password',
                    password_confirmation: 'password')

  puts 'Creating users'
  {
    patient: '+1234567890',
    doctor: '+1234567891'
  }.each do |role, phone_number|
    User.create!(email: "#{role}@example.com",
                 password: 'password',
                 password_confirmation: 'password',
                 phone_number:,
                 role:,
                 first_name: Faker::Name.first_name,
                 last_name: Faker::Name.last_name)
  end

  puts 'Creating patients and doctors'

  User.all.each do |user|
    case user.role
    when 'patient' then Patient.create!(user:)
    when 'doctor' then Doctor.create!(user:)
    end
  end

  puts 'Creating a recomendation'

  Doctor.all.each do |doctor|
    Patient.all.each do |patient|
      DoctorPatient.create!(doctor:, patient:, recommendation: 'Some recomendation')
    end
  end

  puts 'Creating a category'
  Category.create!(name: 'Category 1')

  puts 'Adding a doctor category'

  Category.all.each do |category|
    doctor = Doctor.all.sample
    DoctorCategory.create!(doctor:, category:)
  end
end
