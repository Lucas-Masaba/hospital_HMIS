class CreatePatients < ActiveRecord::Migration[7.0]
  def change
    create_table :patients do |t|
      t.text :name
      t.integer :age
      t.bigint :gender
      t.date :date_of_birth
      t.string :address
      t.bigint :phone_number
      t.string :next_of_kin
      t.bigint :next_of_kin_phone
      t.string :next_of_kin_address

      t.timestamps
    end
  end
end
