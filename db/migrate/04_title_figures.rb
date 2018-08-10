class TitleFigures < ActiveRecord::Migration
  def change
    create_table :title_figures do |t|
      t.integer :figure_id
      t.integer :title_id
    end
  end
end
