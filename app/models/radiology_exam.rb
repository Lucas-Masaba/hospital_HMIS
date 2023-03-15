class RadiologyExam < ApplicationRecord
  belongs_to :visit
  has_one :radiology_result

  validates :name, presence: true
  validates :description, presence: true
  validates :visit_id, presence: true
end
