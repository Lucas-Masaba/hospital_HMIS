class CreatePrescriptions < ActiveRecord::Migration[7.0]
  def change
    create_table :prescriptions do |t|
      t.string :product
      t.integer :quantity
      t.string :symbol
      t.integer :dose
      t.integer :days
      t.integer :stock

      t.timestamps
    end
  end
end
