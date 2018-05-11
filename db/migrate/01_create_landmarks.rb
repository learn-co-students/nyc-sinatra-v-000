class CreateLandmarks < ActiveRecord::Migration[4.2]
  def change
    create_table :landmarks do |t|
      t.string :name
      t.string :figure_id
      t.string :year_created
    end
  end
end
