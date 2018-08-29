class CreateLandmarks < ActiveRecord::Migration
  def change
    create_table :landmarks do |t|
      t.string :name
      t.integer :figure_id
      t.integer :year_completed  #raise 'Write CrateLandmarks migration here'
  end
  end
end
