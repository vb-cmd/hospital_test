ActiveAdmin.register Patient do
  permit_params :user_id

  filter :user, as: :select, collection: -> { User.take_full_names_and_ids_by_role('patient') }
  filter :created_at
  filter :updated_at

  form do |f|
    f.inputs do
      f.input :user_id, as: :select, collection: User.take_full_names_and_ids_by_role('patient')
    end
    f.actions
  end
end
