require 'rails_helper'

RSpec.describe Triage, type: :model do
  subject do
    Triage.new(name: 'Test Triage', value_one: 1, value_two: 2, date_time: DateTime.now)
  end

  before { subject.save }

  it 'is valid with valid attributes' do
    expect(subject).to be_valid
  end

  it 'is invalid without a name' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'is invalid without a value_one' do
    subject.value_one = nil
    expect(subject).to_not be_valid
  end

  it 'is invalid without a value_two' do
    subject.value_two = nil
    expect(subject).to_not be_valid
  end

  it 'is invalid without a date_time' do
    subject.date_time = nil
    expect(subject).to_not be_valid
  end
end
