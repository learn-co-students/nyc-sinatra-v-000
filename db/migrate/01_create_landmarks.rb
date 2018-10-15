class CreateLandmarks < ActiveRecord::Migration
  def change
    create_table :landmarks do |t|
      t.integer :year_completed
      t.string :name
    end
  end
end
