require 'rails_helper'

RSpec.describe NormalRange, type: :model do
  subject { NormalRange.new(name: 'Heart Beat', upper_range: 30000, lower_range: 20000, unit: 'bps') }

  before { subject.save }

  it 'name should be present' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'upper_range should be present' do
    subject.upper_range = nil
    expect(subject).to_not be_valid
  end

  it 'lower_range should be present' do
    subject.lower_range = nil
    expect(subject).to_not be_valid
  end

  it 'unit should be present' do
    subject.unit = nil
    expect(subject).to_not be_valid
  end

  it 'subject should be valid' do
    expect(subject).to be_valid
  end
end
