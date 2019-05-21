class CreateTitles < ActiveRecord::Migration[5.2]
  create_table :titles do |t|
    t.string :name
  end 
end