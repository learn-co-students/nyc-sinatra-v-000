class CreateTitlesTable < ActiveRecord::Migration

  def change
    create_table :titles do |t|
      t.string :name
    end #create_table
  end #changes METHOD

end #CreateTitlesTable CLASS
