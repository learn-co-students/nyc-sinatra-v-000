class CreateFigureTitleTable < ActiveRecord::Migration

  def change
    create_table :figure_titles do |t|
      t.integer :figure_id
      t.integer :title_id
    end #create_table
  end #change METHOD

end
