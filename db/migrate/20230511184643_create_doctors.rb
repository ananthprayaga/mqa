class CreateDoctors < ActiveRecord::Migration[6.0]
  def change
    create_table :doctors do |t|
      t.string :first_name
      t.string :last_name
      t.integer :visits_count

      t.timestamps
    end
  end
end
