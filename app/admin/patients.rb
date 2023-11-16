ActiveAdmin.register Patient do
  permit_params :user_id

  filter :user, as: :select, collection: -> { User.where(role: 'patient').map { |u| [u.full_name, u.id] } }
  filter :created_at
  filter :updated_at

  form do |f|
    f.inputs do
      f.input :user_id, as: :select, collection: User.where(role: 'patient').map { |u| [u.full_name, u.id] }
    end
    f.actions
  end
end
