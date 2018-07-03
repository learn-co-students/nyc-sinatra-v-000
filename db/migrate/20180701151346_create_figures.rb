class CreateFigures < ActiveRecord::Migration
  def change
    create_table :figures do |r|
      r.string :name
    end
  end
end
