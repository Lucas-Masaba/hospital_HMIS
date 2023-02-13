require 'rails_helper'

RSpec.describe Patient, type: :model do
  subject { Patient.new(name: 'Kemigisa Diana', age: 12, gender: "F", date_of_birth: "2023-01-23", address: 'Kampala', phone_number: +256777777777, next_of_kin: 'Mwine Tom', next_of_kin_phone: +256770773778, next_of_kin_address: 'Kampala') }

  before { subject.save }

  it 'name should be present' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'age should be present' do
    subject.age = nil
    expect(subject).to_not be_valid
  end

  it 'gender should be present' do
    subject.gender = nil
    expect(subject).to_not be_valid
  end

  it 'date_of_birth should be present' do
    subject.date_of_birth = nil
    expect(subject).to_not be_valid
  end

  it 'address should be present' do
    subject.address = nil
    expect(subject).to_not be_valid
  end

  it 'next_of_kin should be present' do
    subject.next_of_kin = nil
    expect(subject).to_not be_valid
  end

  it 'next_of_kin_address should be present' do
    subject.next_of_kin_address = nil
    expect(subject).to_not be_valid
  end
end
