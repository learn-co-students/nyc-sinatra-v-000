class CreateLandmarks < ActiveRecord::Migration
  def change
    create_table :landmaks do |t|
      t.string :name
      t.integer :figure_id
      t.integer :year_comleted
    end
  end
end
