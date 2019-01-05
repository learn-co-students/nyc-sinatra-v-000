class CreateLandmarks < ActiveRecord::Migration
  def change
   creat_table :landmarks do |t|
     t.string :name
     t.integer :figure_id
     t.integer :year_completed
    end
   end
  end
