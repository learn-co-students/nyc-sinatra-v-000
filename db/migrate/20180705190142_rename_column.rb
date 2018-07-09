class RenameColumn < ActiveRecord::Migration
  def change
      rename_column :landmarks, :years_completed, :year_completed
  end
end
