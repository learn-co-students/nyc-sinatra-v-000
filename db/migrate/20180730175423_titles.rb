class Titles < ActiveRecord::Migration
  def change
    create_table :title do |t|
      t.string :name
    end
  end
end
