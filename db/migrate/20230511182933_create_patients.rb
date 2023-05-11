class CreatePatients < ActiveRecord::Migration[6.0]
  def change
    create_table :patients do |t|
      t.string :first_name
      t.string :last_name
      t.date :dob
      t.string :phone_number
      t.integer :visits_count

      t.timestamps
    end
  end
end
