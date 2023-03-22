require 'rails_helper'

RSpec.describe LabResult, type: :model do
  subject { LabResult.new(results: 'Negative') }

  before { subject.save }

  it 'lab result should be present' do
    subject.results = nil
    expect(subject).to_not be_valid
  end
end
