class CreateFigures < ActiveRecord::Migration

  def change
    create_table :figures do |t|
      t.string :name
      t.integer :landmark_id
      t.integer :figure_titles
    end
  end
end
