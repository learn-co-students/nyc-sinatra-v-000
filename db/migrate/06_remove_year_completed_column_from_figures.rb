class RemoveYearCompletedColumnFromFigures < ActiveRecord::Migration
  def change
    remove_column :figures, :year_completed
  end
end
