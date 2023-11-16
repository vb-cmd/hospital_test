ActiveAdmin.register Category do
  permit_params :name

  filter :name
  filter :created_at
  filter :updated_at

  show do
    attributes_table do
      row :name
      row :doctors_count
      row :created_at
      row :updated_at
    end
    active_admin_comments
  end

  index do
    selectable_column
    id_column
    column :name
    column :doctors_count
    column :created_at
    column :updated_at
    actions
  end
end
