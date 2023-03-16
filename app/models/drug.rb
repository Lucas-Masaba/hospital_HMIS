class Drug < ApplicationRecord
  belongs_to :visit

  validates :name, presence: true, length: { minimum: 2, maximum: 50 }
  validates :quantity, presence: true, numericality: { only_integer: true, greater_than: 0 }
  validates :drug_no, presence: true, numericality: { only_integer: true, greater_than: 0 }
  validates :location, presence: true, length: { minimum: 2, maximum: 50 }
end
