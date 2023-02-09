class CreateLabTests < ActiveRecord::Migration[7.0]
  def change
    create_table :lab_tests do |t|
      t.string :name
      t.integer :price
      t.string :status
      t.string :referral_status

      t.timestamps
    end
  end
end
