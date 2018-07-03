class CreateLandmarks < ActiveRecord::Migration
  # raise 'Write CreateLandmarks migration here'
  create_table :landmarks do |r|
    r.string :name
    r.integer :year_completed
  end
end
