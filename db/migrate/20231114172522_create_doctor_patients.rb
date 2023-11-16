class CreateDoctorPatients < ActiveRecord::Migration[7.1]
  def change
    create_table :doctor_patients do |t|
      t.references :doctor, null: false, foreign_key: true
      t.references :patient, null: false, foreign_key: true
      t.text :recommendation
      t.boolean :closed, default: false

      t.timestamps
    end
  end
end
