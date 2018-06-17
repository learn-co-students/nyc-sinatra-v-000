class AddTitleidsToFigures < ActiveRecord::Migration
  def change
    add_column :figures, :title_ids, :integer
  end
end
