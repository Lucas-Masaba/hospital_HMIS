class CreateTriages < ActiveRecord::Migration[7.0]
  def change
    create_table :triages do |t|
      t.text :name
      t.string :value_one
      t.string :value_two
      t.datetime :date_time

      t.timestamps
    end
  end
end
