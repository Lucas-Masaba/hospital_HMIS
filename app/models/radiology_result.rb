class RadiologyResult < ApplicationRecord
  validates :image, presence: true
  validates :notes, presence: true
end
