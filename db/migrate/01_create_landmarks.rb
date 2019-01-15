class CreateLandmarks < ActiveRecord::Migration
  #raise 'Write CreateLandmarks migration here'
  def change
    create_table :landmarks do |c|
      c.string :name
      c.integer :figure_id
      c.integer :year_completed
    end
  end
end
