class CreateLandmarks < ActiveRecord::Migration
  def change
    create_table :landmarks do |landmark|
      landmark.string :name
      landmark.integer :figure_id
      landmark.integer :year_completed
    end
  end
end
