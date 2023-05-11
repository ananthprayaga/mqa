class CreateVisits < ActiveRecord::Migration[6.0]
  def change
    create_table :visits do |t|
      t.date :date_of_visit
      t.integer :patient_id
      t.text :description
      t.string :medical_specialty
      t.text :transcription
      t.text :keywords
      t.integer :doctor_id

      t.timestamps
    end
  end
end
