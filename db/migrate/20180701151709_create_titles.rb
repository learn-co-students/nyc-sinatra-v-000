class CreateTitles < ActiveRecord::Migration
  def change
    create_table :titles do |r|
      r.string :name
    end
  end
end
