class CreateFigureTitles < ActiveRecord::Migration
  def change
    create_join_table :figures, :titles do |t|
      t.integer :figure_id
      t.integer :title_id
    end
  end
end
