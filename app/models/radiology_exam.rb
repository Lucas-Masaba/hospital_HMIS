class RadiologyExam < ApplicationRecord
  belongs_to :visit

  validates :name, presence: true
  validates :description, presence: true
  validates :visit_id, presence: true
end
