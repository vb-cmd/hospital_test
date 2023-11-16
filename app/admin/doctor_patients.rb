ActiveAdmin.register DoctorPatient do
  permit_params :doctor_id, :patient_id, :recommendation, :closed

  filter :doctor, as: :select, collection: -> { Doctor.all.map { |u| [u.user.full_name, u.id] } }
  filter :patient, as: :select, collection: -> { Patient.all.map { |u| [u.user.full_name, u.id] } }
  filter :recommendation
  filter :closed
  filter :created_at
  filter :updated_at

  index do
    selectable_column
    id_column
    column :doctor do |recomendation|
      recomendation.doctor.user.full_name
    end
    column :patient do |recomendation|
      recomendation.patient.user.full_name
    end
    column :recommendation
    column :closed
    actions
  end

  show do
    attributes_table do
      row :doctor do |doctor_patient|
        doctor_patient.doctor.user.full_name
      end
      row :patient do |doctor_patient|
        doctor_patient.patient.user.full_name
      end
      row :recommendation
      row :closed
      row :created_at
      row :updated_at
    end
    active_admin_comments
  end

  form do |f|
    f.inputs do
      f.input :doctor_id, as: :select, collection: Doctor.all.map { |u| [u.user.full_name, u.id] }
      f.input :patient_id, as: :select, collection: Patient.all.map { |u| [u.user.full_name, u.id] }
      f.input :recommendation
      f.input :closed
    end
    f.actions
  end
end
