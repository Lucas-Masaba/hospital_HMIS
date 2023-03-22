class AddVisitToTriage < ActiveRecord::Migration[7.0]
  def change
    add_reference :triages, :visit, null: false, foreign_key: true
  end
end
