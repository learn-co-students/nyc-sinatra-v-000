class CreateFigureTitles < ActiveRecord::Migration
  def change
    create_table :figure_titles do |figure_title|
      figure_title.integer :figure_id
      figure_title.integer :title_id
    end
  end
end
