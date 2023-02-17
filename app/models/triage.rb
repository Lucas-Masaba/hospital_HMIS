class Triage < ApplicationRecord
  validates :name, presence:true, length: { minimum: 2, maximum: 20 }
  validates :value_one, presence:true
  validates :value_two, presence:true
  validates :date_time, presence:true
end
