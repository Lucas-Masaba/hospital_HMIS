class AddNameToStaffs < ActiveRecord::Migration[7.0]
  def change
    add_column :staffs, :name, :string
    add_column :staffs, :age, :integer
    add_column :staffs, :gender, :string
    add_column :staffs, :speciality, :string
    add_column :staffs, :contact, :string
  end
end
