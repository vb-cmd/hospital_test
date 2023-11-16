ActiveAdmin.register User do
  permit_params :email, :phone_number, :role, :first_name, :last_name

  index do
    selectable_column
    id_column
    column :email
    column :phone_number
    column :role
    column :first_name
    column :last_name
    actions
  end

  show do
    attributes_table do
      row :email
      row :phone_number
      row :role
      row :first_name
      row :last_name
    end
    active_admin_comments
  end

  form do |f|
    f.inputs do
      f.input :email
      f.input :phone_number
      f.input :role
      f.input :first_name
      f.input :last_name
    end
    f.actions
  end
end
