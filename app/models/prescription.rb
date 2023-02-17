class Prescription < ApplicationRecord
  validates :product, presence: true, length: { minimum: 3, maximum: 50 }
  validates :quantity, presence: true, numericality: { only_integer: true, greater_than: 0 }
  validates :symbol, presence: true
  validates :dose, presence: true, numericality: { only_integer: true, greater_than: 0 }
  validates :days, presence: true, numericality: { only_integer: true, greater_than: 0 }
  validates :stock, presence: true
end
