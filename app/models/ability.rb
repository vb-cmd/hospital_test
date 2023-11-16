# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    @user = user
    return unless user

    case user.role
    when 'patient' then patient_access
    when 'doctor' then doctor_access
    end
  end

  private

  def patient_access
    can :read, Patient, user: @user
    can :index, :doctor
    can %i[create index], :recommendation
  end

  def doctor_access
    can :read, Doctor, user: @user
    can %i[read update], DoctorPatient, doctor: { user: @user }
  end
end
