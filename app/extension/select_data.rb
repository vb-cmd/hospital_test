module SelectData
  def take_full_names_and_ids
    all.includes(:user).map { |u| [u.user.full_name, u.id] }
  end
end
