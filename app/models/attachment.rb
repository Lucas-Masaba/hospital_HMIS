class Attachment < ApplicationRecord
  validates :description, presence: true, length: { minimum: 3 }
  validates :name, presence: true
  validates :admissions, presence: true
end
