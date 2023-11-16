ActiveAdmin.register DoctorCategory do
  permit_params :doctor_id, :category_id

  index do
    selectable_column
    id_column
    column 'Doctor' do |doctor_patient|
      doctor_patient.doctor.user.full_name
    end
    column :category
    actions
  end

  show do
    attributes_table do
      row :doctor do |doctor_category|
        doctor_category.doctor.user.full_name
      end
      row :category
    end
    active_admin_comments
  end

  form do |f|
    f.inputs do
      f.input :doctor_id, as: :select, collection: Doctor.all.map { |u| [u.user.full_name, u.id] }
      f.input :category
    end
    f.actions
  end
end
