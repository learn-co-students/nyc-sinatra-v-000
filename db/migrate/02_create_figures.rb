class CreateFigures < ActiveRecord::Migration

  def change
    create_table :figures do |t|
      t.string :name
      t.string :year_completed
    end
  end
end
