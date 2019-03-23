class FigureLandmarks < ActiveRecord::Migration
  def change
    create_table :figurelandmarks do |t|
      t.integer :figure_id
      t.integer :genre_id
    end
  end
end
