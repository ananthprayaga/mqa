class RemoveVisitsCountFromPatients < ActiveRecord::Migration[6.0]
  def change
    remove_column :patients, :visits_count
  end
end
