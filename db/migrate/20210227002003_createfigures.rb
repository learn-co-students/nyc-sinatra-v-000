class Createfigures < ActiveRecord::Migration
  def change
    create_table :figures do |f|
      f.string :name
    end
  end
end


