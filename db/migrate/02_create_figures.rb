class CreateFigures < ActiveRecord::Migration
  def change
    create_table :figures do |t|
      t.sting :name
    end
  end
end
