class CreateFigures < ActiveRecord::Migration
  def change
    create_table :figures do |c|
      c.string :name
    end
  end
end
