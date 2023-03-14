class Attachment < ApplicationRecord
  belongs_to :visit

  validates :visit_id, presence: true
  validates :description, presence: true, length: { minimum: 3 }
  validates :name, presence: true
  validates :admissions, presence: true
end
