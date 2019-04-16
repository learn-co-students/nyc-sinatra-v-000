class CreateFigures < ActiveRecord::Migration
  # raise 'Write CreateLandmarks migration here'
  def change
    create_table :figures do |t|
      t.integer :id
      t.string :name
  end
