class DropColumnFromFigures < ActiveRecord::Migration
  def change
    remove_column :figures, :title_id
  end
end
