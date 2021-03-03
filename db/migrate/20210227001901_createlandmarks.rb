class Createlandmarks < ActiveRecord::Migration
  def change
    create_table :landmarks do |lm|
      lm.string :name
      lm.integer :year_completed
      lm.integer :figure_id
    end
  end
end
