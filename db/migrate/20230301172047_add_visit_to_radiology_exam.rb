class AddVisitToRadiologyExam < ActiveRecord::Migration[7.0]
  def change
    add_reference :radiology_exams, :visit, null: false, foreign_key: true
  end
end
