class CreateDrugs < ActiveRecord::Migration[7.0]
  def change
    create_table :drugs do |t|
      t.string :name
      t.integer :quantity
      t.string :location
      t.bigint :drug_no

      t.timestamps
    end
  end
end
