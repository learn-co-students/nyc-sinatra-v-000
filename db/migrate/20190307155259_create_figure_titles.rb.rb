class CreateFigureTitles < ActiveRecord::Migration
  def change
    create_table :figure_titles do |i|
      i.integer :title_id
      i.integer :figure_id
    end
  end
end
