ActiveAdmin.register DoctorPatient do
  permit_params :doctor_id, :patient_id, :recommendation, :closed

  filter :doctor, as: :select, collection: -> { Doctor.take_full_names_and_ids }
  filter :patient, as: :select, collection: -> { Patient.take_full_names_and_ids }
  filter :recommendation
  filter :closed
  filter :created_at
  filter :updated_at

  index do
    selectable_column
    id_column
    column :doctor_full_name
    column :patient_full_name
    column :recommendation
    column :closed
    actions
  end

  show do
    attributes_table do
      row :doctor_full_name
      row :patient_full_name
      row :recommendation
      row :closed
      row :created_at
      row :updated_at
    end
    active_admin_comments
  end

  form do |f|
    f.inputs do
      f.input :doctor_id, as: :select, collection: -> { Doctor.take_full_names_and_ids }
      f.input :patient_id, as: :select, collection: -> { Patient.take_full_names_and_ids }
      f.input :recommendation
      f.input :closed
    end
    f.actions
  end
end
