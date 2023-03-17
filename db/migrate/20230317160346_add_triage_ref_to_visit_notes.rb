class AddTriageRefToVisitNotes < ActiveRecord::Migration[7.0]
  def change
    add_reference :visit_notes, :triage, null: false, foreign_key: true
  end
end
