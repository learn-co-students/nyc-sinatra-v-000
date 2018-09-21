class ChangeYearCompletedToInteger < ActiveRecord::Migration
  def change
    remove_column :landmarks, :year_completed, :string
  end
end
