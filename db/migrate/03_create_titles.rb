class CreateTitles< ActiveRecord::Migration
  # raise 'Write CreateLandmarks migration here'
  def change
    create_table :titles do |t|
      t.integer :id
      t.string :name
  end
