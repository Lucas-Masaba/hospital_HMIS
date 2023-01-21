class Visit < ApplicationRecord
  # belongs_to :patient
  # has_many :diagnoses, dependent: :destroy
  # has_many :attachments, dependent: :destroy
  has_many :prescriptions, dependent: :destroy
  # has_many :triages, dependent: :destroy
  # has_many :visit_notes, dependent: :destroy
  # has_many :drugs, dependent: :destroy
  # has_many :staff, dependent: :destroy
  # has_many :radiology_exams, dependent: :destroy
  # has_many :laboratory_tests, dependent: :destroy
  # has_many :lab_results, dependent: :destroy
  # has_many :pharmacies, dependent: :destroy

  validates :visit_owner, presence: true, length: { minimum: 3, maximum: 20 }
  validates :visit_type, presence: true, length: { minimum: 3, maximum: 10 }
  validates :visit_date, presence: true
  validates :visit_category, presence: true, length: { minimum: 3, maximum: 10 }
end
