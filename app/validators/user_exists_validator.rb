class UserExistsValidator < ActiveModel::Validator
  def validate(record)
    record.errors.add(:user, 'already exists') if record.class.exists?(user: record.user)
  end
end
