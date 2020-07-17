class CreateTitles < ActiveRecord::Migration
  def change
    create_table :titles do |title|
      title.string :name
    end
  end
end
