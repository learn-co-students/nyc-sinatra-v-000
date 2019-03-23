class CreateTitles < ActiveRecord::Migration
  def self.up
    create_table :titles do |t|
      t.string :name
    end
  end
end
