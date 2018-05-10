class CreateLandmarks < ActiveRecord::Migration[4.2]
  def change
    create_table :landmarks do |t|
      t.string :name
      t.integer :figure_id
      t.string :year_completed
      t.timestamps null: false
    end
  end
end
