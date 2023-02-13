require 'rails_helper'

RSpec.describe Attachment, type: :model do
  subject { Attachment.new(name: 'Xray', description: 'Broken femur', admissions: '5') }

  before { subject.save }

  it 'name should be present' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'name should be present' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'description should be present' do
    subject.description = nil
    expect(subject).to_not be_valid
  end

  it 'admissions should be present' do
    subject.admissions = nil
    expect(subject).to_not be_valid
  end

  it 'subject should be valid' do
    expect(subject).to be_valid
  end
end
