require 'rails_helper'

RSpec.describe Drug, type: :model do
  subject do
    Drug.new(name: "Metrogyl", quantity: 100, drug_no: 1, location: "Store1")
  end

  before { subject.save }

  it 'is valid with valid attributes' do
    expect(subject).to be_valid
  end

  context 'name validations' do
    it 'is invalid without a name' do
      subject.name = nil
      expect(subject).to_not be_valid
    end

    it 'is invalid with a name that is too short' do
      subject.name = 'a'
      expect(subject).to_not be_valid
    end

    it 'is invalid with a name that is too long' do
      subject.name = 'a' * 51
      expect(subject).to_not be_valid
    end
  end

  context 'location validations' do
    it 'is invalid without a location' do
      subject.location = nil
      expect(subject).to_not be_valid
    end

    it 'is invalid with a location that is too short' do
      subject.location = 'a'
      expect(subject).to_not be_valid
    end

    it 'is invalid with a location that is too long' do
      subject.location = 'a' * 51
      expect(subject).to_not be_valid
    end
  end

  it 'is invalid without a quantity' do
    subject.quantity = nil
    expect(subject).to_not be_valid
  end

  it 'is invalid without a drug_no' do
    subject.drug_no = nil
    expect(subject).to_not be_valid
  end
end
