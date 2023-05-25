class CreateQas < ActiveRecord::Migration[6.0]
  def change
    create_table :qas do |t|
      t.string :question
      t.string :answer
      t.integer :visit_id

      t.timestamps
    end
  end
end
