class CreateFigures < ActiveRecord::Migration
  
  def change 
    create table :figure_titles do |t|
      t.integer :figure_id
      t.integer :title_id
    end
  end
end