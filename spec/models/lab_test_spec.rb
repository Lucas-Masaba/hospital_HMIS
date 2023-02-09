require 'rails_helper'

RSpec.describe LabTest, type: :model do
  subject { LabTest.new(name: 'Blood Test', price: 30_000, status: 'Negative', referral_status: 'Unknown') }

  before { subject.save }

  it 'name should be present' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'price should be present' do
    subject.price = nil
    expect(subject).to_not be_valid
  end

  it 'referral_status should be present' do
    subject.referral_status = nil
    expect(subject).to_not be_valid
  end

  it 'status should be present' do
    subject.status = nil
    expect(subject).to_not be_valid
  end

  it 'subject should be valid' do
    expect(subject).to be_valid
  end
end
