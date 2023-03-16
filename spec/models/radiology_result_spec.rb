require 'rails_helper'

RSpec.describe RadiologyResult, type: :model do
  subject { RadiologyResult.new(image: 'Heart Scan', notes: 'This is a long description') }

  before { subject.save }

  it 'image should be present' do
    subject.image = nil
    expect(subject).to_not be_valid
  end

  it 'notes should be present' do
    subject.notes = nil
    expect(subject).to_not be_valid
  end
end
