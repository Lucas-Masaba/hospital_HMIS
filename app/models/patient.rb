class Patient < ApplicationRecord
  validates :name, presence: true, length: { minimum:3, maximum: 50 }
  validates :age, presence: true, numericality: { only_integer: true, greater_than: 0, less_than: 150 }
  validates :gender, presence:true
  validates :date_of_birth, presence: true
  validates :address, presence: true
  validates :next_of_kin, presence: true, length: { minimum:3, maximum: 50 }
  validates :next_of_kin_address, presence: true
end
