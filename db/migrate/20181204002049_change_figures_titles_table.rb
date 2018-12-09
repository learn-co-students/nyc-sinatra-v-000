class ChangeFiguresTitlesTable < ActiveRecord::Migration
  def change
    rename_table :figures_titles, :figure_titles
  end
end
