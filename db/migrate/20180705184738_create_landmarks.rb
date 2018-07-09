class CreateLandmarks < ActiveRecord::Migration
  def change
      create_table :landmarks do |t|
          t.string :name
          t.integer :figure_id
          t.integer :years_completed
      end
  end
end
