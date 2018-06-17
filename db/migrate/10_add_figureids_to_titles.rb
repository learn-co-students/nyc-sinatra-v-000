class AddFigureidsToTitles < ActiveRecord::Migration
  def change
    add_column :titles, :figure_ids, :integer
  end
end
