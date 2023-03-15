class AddRadiologyExamToRadiologyResult < ActiveRecord::Migration[7.0]
  def change
    add_reference :radiology_results, :radiology_exam, null: false, foreign_key: true
  end
end
