class AddVisitToDrug < ActiveRecord::Migration[7.0]
  def change
    add_reference :drugs, :visit, null: false, foreign_key: true
  end
end
