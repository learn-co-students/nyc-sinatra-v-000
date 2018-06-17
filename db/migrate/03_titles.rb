class CreateTitles < ActiveRecord::Migration
  def change
    create_table :titles do |t|
      t.sting :name
    end
  end
end
