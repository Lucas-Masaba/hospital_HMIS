class VisitNote < ApplicationRecord
  validates :complaints, presence: true
  validates :provisional_diagnosis, presence: true
end
