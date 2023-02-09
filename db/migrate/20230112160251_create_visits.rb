class CreateVisits < ActiveRecord::Migration[7.0]
  def change
    create_table :visits do |t|
      t.integer :visit_no
      t.string :visit_owner
      t.date :visit_date
      t.text :visit_type
      t.text :visit_category
      t.string :speciality
      t.string :member_no
      t.string :service

      t.timestamps
    end
  end
end
