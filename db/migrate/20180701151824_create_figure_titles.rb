class CreateFigureTitles < ActiveRecord::Migration
  def change
    create_table :figure_titles do |r|
      r.integer :title_id
      r.integer :figure_id
    end
  end
end
