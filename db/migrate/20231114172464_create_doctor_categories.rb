class CreateDoctorCategories < ActiveRecord::Migration[7.1]
  def change
    create_table :doctor_categories do |t|
      t.references :doctor, null: false, foreign_key: true
      t.references :category, null: false, foreign_key: true
      
      t.timestamps
    end
  end
end
