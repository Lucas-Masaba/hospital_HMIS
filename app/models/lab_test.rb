class LabTest < ApplicationRecord
  belongs_to :visit
  has_one :normal_range

  validates :name, presence: true
  validates :price, presence: true, numericality: { only_integer: true }
  validates :status, presence: true
  validates :referral_status, presence: true
  validates :visit_id, presence: true
end
