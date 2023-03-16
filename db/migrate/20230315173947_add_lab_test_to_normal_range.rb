class AddLabTestToNormalRange < ActiveRecord::Migration[7.0]
  def change
    add_reference :normal_ranges, :lab_test, null: false, foreign_key: true
  end
end
