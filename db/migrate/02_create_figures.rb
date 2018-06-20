class CreateFigures < ActiveRecord::Migration
  def change
    create_table :figures do |t|
      t.string :name
      t.integer :title_ids
    end
  end
end
