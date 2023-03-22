class Pharmacy < ApplicationRecord
  validates :dispensed, presence: true, numericality: { only_integer: true }
end
