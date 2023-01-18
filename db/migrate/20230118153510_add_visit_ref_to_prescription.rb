class AddVisitRefToPrescription < ActiveRecord::Migration[7.0]
  def change
    add_reference :prescriptions, :visit, null: false, foreign_key: true
  end
end
