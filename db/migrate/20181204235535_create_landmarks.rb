class CreateLandmarks < ActiveRecord::Migration
  def change
    create_table :landmarks do |i|
      i.string :name
      i.integer :figure_id
      i.integer :year_completed
    end
  end
end
