class NormalRange < ApplicationRecord
  validates :name, presence: true, length: { minimum: 3, maximum: 20 }
  validates :upper_range, presence: true, numericality: { only_float: true }
  validates :lower_range, presence: true, numericality: { only_float: true }
  validates :unit, presence: true
end
