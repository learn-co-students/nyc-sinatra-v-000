class CreateLandmarks < ActiveRecord::Migration
  def change 
    create_table :landmarks do |t|
      t.string :name
      t.belongs_to :figure
      t.string :year_copmleted
    end
  end

end
