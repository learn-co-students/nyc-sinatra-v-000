class CreateFigureTitlesTable < ActiveRecord::Migration
  def change
    create_table :figures_title do |t|
      t.integer :title_id
      t.integer :figure_id
    end
  end
end
