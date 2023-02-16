class CreatePharmacies < ActiveRecord::Migration[7.0]
  def change
    create_table :pharmacies do |t|
      t.integer :dispensed

      t.timestamps
    end
  end
end
