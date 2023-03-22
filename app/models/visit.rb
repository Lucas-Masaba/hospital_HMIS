class Visit < ApplicationRecord
  belongs_to :patient
  has_many :attachments, dependent: :destroy
  has_many :prescriptions, dependent: :destroy
  has_many :drugs, dependent: :destroy
  has_many :triages, dependent: :destroy
  has_many :radiology_exams, dependent: :destroy
  has_many :lab_tests, dependent: :destroy

  validates :visit_no, presence: true
  validates :visit_owner, presence: true, length: { minimum: 3, maximum: 20 }
  validates :visit_type, presence: true, length: { minimum: 3, maximum: 10 }
  validates :visit_date, presence: true
  validates :visit_category, presence: true, length: { minimum: 3, maximum: 10 }
  validates :patient_id, presence: true
  validates :speciality, presence: true
  validates :member_no, presence: true
  validates :service, presence: true
end
