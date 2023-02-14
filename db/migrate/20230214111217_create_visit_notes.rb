class CreateVisitNotes < ActiveRecord::Migration[7.0]
  def change
    create_table :visit_notes do |t|
      t.text :complaints
      t.string :provisional_diagnosis

      t.timestamps
    end
  end
end
