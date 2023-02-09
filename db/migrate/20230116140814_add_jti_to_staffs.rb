class AddJtiToStaffs < ActiveRecord::Migration[7.0]
  def change
    add_column :staffs, :jti, :string, null: false
    add_index :staffs, :jti, unique: true
  end
end
