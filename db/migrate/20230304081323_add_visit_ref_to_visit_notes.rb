class AddVisitRefToVisitNotes < ActiveRecord::Migration[7.0]
  def change
    add_reference :visit_notes, :visit, null: false, foreign_key: true
  end
end
