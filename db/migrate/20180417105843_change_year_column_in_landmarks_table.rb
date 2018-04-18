class ChangeYearColumnInLandmarksTable < ActiveRecord::Migration[5.1]
  def change
    rename_column :landmarks, :year, :year_completed
  end
end
