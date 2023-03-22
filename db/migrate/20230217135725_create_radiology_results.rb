class CreateRadiologyResults < ActiveRecord::Migration[7.0]
  def change
    create_table :radiology_results do |t|
      t.string :image
      t.string :notes

      t.timestamps
    end
  end
end
