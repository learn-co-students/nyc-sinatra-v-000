class CreateLandmarks < ActiveRecord::Migration
  # raise 'Write CreateLandmarks migration here'
  def change
    create_table :landmarks do |t|
      t.string :name
      t.integer :year_completed
      t.integer :landmark_id
      t.integer :figure_id
    end
  end
end