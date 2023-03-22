class VisitNote < ApplicationRecord
  belongs_to :visit
  belongs_to :triage

  validates :complaints, presence: true
  validates :provisional_diagnosis, presence: true
end
