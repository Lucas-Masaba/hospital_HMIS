class VisitNote < ApplicationRecord
  belongs_to :visit

  validates :complaints, presence: true
  validates :provisional_diagnosis, presence: true
end
