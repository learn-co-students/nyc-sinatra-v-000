class CreateFiguresTitleJoinTable < ActiveRecord::Migration
  def change
    create_join_table :figures, :titles do |t|
      t.integer :title_id
      t.integer :figure_id
    end
  end
end
