class CreateLabResults < ActiveRecord::Migration[7.0]
  def change
    create_table :lab_results do |t|
      t.string :results

      t.timestamps
    end
  end
end
