require 'rails_helper'

RSpec.describe LabResult, type: :model do
  subject { LabResult.new(lab_result: 'Negative') }

  before { subject.save }

  it 'lab result should be present' do
    subject.lab_result = nil
    expect(subject).to_not be_valid
  end
end
