class LabTest < ApplicationRecord
  validates :name, presence: true
  validates :price, presence: true, numericality: { only_integer: true }
  validates :status, presence: true
  validates :referral_status, presence: true
end
