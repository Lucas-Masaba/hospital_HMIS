require 'rails_helper'

RSpec.describe RadiologyExam, type: :model do
  subject { RadiologyExam.new(name: 'Heart Scan', description: 'This is a long description') }

  before { subject.save }

  it 'name should be present' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'description should be present' do
    subject.description = nil
    expect(subject).to_not be_valid
  end
end
