class RadiologyResult < ApplicationRecord
  belongs_to :radiology_exam

  validates :image, presence: true
  validates :notes, presence: true
  validates :radiology_exam_id, presence: true
end
