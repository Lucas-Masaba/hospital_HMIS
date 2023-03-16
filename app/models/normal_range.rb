class NormalRange < ApplicationRecord
  belongs_to :lab_test

  validates :name, presence: true, length: { minimum: 3, maximum: 20 }
  validates :upper_range, presence: true, numericality: { only_float: true }
  validates :lower_range, presence: true, numericality: { only_float: true }
  validates :unit, presence: true
  validates :lab_test_id, presence: true
end
