class CreateFigures < ActiveRecord::Migration[5.2]
  create_table :figures do |t|
    t.string :name
  end 
end
