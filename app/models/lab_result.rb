class LabResult < ApplicationRecord
  validates :lab_result, presence: true, format: { with: /\A[a-zA-Z]+\z/,
                                                   message: 'only allows letters' }
end
