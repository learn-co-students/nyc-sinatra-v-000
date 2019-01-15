class CreateFigureTitles < ActiveRecord::Migration
  def change
    create_table :figure_titles do |c|
      c.integer :title_id
      c.integer :figure_id
    end
  end
end
