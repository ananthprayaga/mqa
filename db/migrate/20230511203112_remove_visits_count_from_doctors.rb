class RemoveVisitsCountFromDoctors < ActiveRecord::Migration[6.0]
  def change
    remove_column :doctors, :visits_count
  end
end
