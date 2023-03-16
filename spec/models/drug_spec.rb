require 'rails_helper'

RSpec.describe Drug, type: :model do
  let!(:patient) do
    Patient.create!(
      name: 'Kemigisa Diana',
      age: 12, gender: 'F',
      date_of_birth: '2023-01-23',
      address: 'Kampala',
      phone_number: 256_777_777_777,
      next_of_kin: 'Mwine Tom',
      next_of_kin_phone: 256_770_773_778,
      next_of_kin_address: 'Kampala'
    )
  end

  let!(:visit) do
    Visit.create!(
      visit_no: '2',
      visit_owner: 'Caitylyn',
      visit_date: '2023-01-23',
      visit_type: 'review',
      visit_category: 'insurance',
      speciality: 'cardiology',
      member_no: '2A5R2',
      service: 'Consultation',
      patient_id: patient.id
    )
  end
  subject do
    Drug.new(
      name: 'Metrogyl',
      quantity: 100,
      drug_no: 1,
      location: 'Store1',
      visit_id: visit.id
    )
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
