class AddInfo < ActiveRecord::Migration
  def change
    add_column :landmarks, :name, :string
    add_column :landmarks, :figure_id, :integer
  end
end
