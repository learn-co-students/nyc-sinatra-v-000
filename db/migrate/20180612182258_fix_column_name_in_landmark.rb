class FixColumnNameInLandmark < ActiveRecord::Migration
  def change
      change_table :landmarks do |t|
        t.rename :year_copmleted, :year_completed
      end
  end
end
