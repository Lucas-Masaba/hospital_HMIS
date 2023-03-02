class AddVisitToLabTest < ActiveRecord::Migration[7.0]
  def change
    add_reference :lab_tests, :visit, null: false, foreign_key: true
  end
end
