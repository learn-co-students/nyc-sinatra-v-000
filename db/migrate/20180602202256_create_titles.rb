class CreateTitles < ActiveRecord::Migration
  def change
    create_tables :titles do |t|
      t.string :name
    end
  end
end