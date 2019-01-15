class CreateTitles < ActiveRecord::Migration
  def change
    create_table :titles do |c|
      c.string :name
    end
  end
end
