class CreateNormalRanges < ActiveRecord::Migration[7.0]
  def change
    create_table :normal_ranges do |t|
      t.string :name
      t.float :lower_range
      t.float :upper_range
      t.string :unit

      t.timestamps
    end
  end
end
