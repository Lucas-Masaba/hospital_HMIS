class Prescription < ApplicationRecord
  # belongs_to :patient
  # belongs_to :visit

  validates :product, presence: true, length: { minimum: 3, maximum: 50 }
  validates :quantity, presence: true
  validates :dose, presence: true
  validates :symbol, presence: true
  validates :days, presence: true
  validates :stock, presence: true
end
