class CreateFigureTitles < ActiveRecord::Migration
  def change
    create_table :figure_titles do |fg|
      fg.integer :title_id 
      fg.integer :figure_id 
    end 
  end
end
