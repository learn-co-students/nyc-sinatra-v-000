class DestroyTables < ActiveRecord::Migration[5.1]
  def change
    drop_table :figure_titles
    drop_table :figures
    drop_table :landmarks
    drop_table :titles
  end
end
